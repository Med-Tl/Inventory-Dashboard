pipeline {
    agent any

    tools {
        maven 'Maven'
        jdk 'Java17'
    }

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/Med-Tl/Inventory-Dashboard.git'
            }
        }

        stage('Start Database') {
            steps {
                sh 'docker-compose up -d --force-recreate --build db' // Only start DB service
                sh 'sleep 15' // wait for DB to initialize
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean test'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
                    sh 'mvn sonar:sonar -Dsonar.projectKey=inventory-dashboard'
                }
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // Option 1: deploy to local Tomcat (existing setup)
                sh '''
                    sudo cp target/*.war /opt/tomcat/webapps/inv.war
                    sudo systemctl restart tomcat
                    sleep 10
                '''
            }
        }

        stage('Check Application') {
            steps {
                sh 'curl -f http://192.168.142.130:8085/inv/'
            }
        }

        stage('DAST - OWASP ZAP') {
            steps {
                sh '''
                    zap-baseline.py \
                        -t http://192.168.142.130:8085/inv \
                        -r zap_report.html \
                        || true
                '''
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: '**/target/*.war', allowEmptyArchive: false
            archiveArtifacts artifacts: 'zap_report.html', allowEmptyArchive: true
        }
    }
}

