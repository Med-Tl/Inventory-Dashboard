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
                sh '''
                    sudo cp target/*.war /var/lib/tomcat/webapps/inv.war
                    sudo systemctl restart tomcat
                    sleep 10
                '''
            }
        }

        stage('Check Application') {
            steps {
                sh 'curl -f http://192.168.142.130:8081/inv/'
            }
        }

        stage('DAST - OWASP ZAP') {
            steps {
                sh '''
                    zap-baseline.py \
                        -t http://192.168.142.130:8081/inv \
                        -r zap_report.html \
                        || true
                '''
            }
        }
    }

    post {
        always {
            // Save WAR file
            archiveArtifacts artifacts: '**/target/*.war', allowEmptyArchive: false

            // Save OWASP ZAP HTML report
            archiveArtifacts artifacts: 'zap_report.html', allowEmptyArchive: true
        }
    }
}
