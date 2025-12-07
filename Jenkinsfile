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
                // Remove old container if exists
                sh 'docker rm -f inventory-db || true'

                // Start DB container (reuse existing volume)
                sh 'docker-compose up -d --build db'

                // Wait for DB to initialize
                sh 'sleep 15'

                // Ensure users table exists and insert admin with jBCrypt hash
                sh '''
                    docker exec inventory-db psql -U inventoryuser -d inventorydb -c "
                    CREATE TABLE IF NOT EXISTS users (
                        id SERIAL PRIMARY KEY,
                        username VARCHAR(50) UNIQUE NOT NULL,
                        password VARCHAR(255) NOT NULL,
                        role VARCHAR(20) NOT NULL
                    );

                    INSERT INTO users (username, password, role)
                    VALUES ('admin', '$2a$10$7Z6KGa.MS9tb9MGi9JvM3eRFbcu3tbP.mHhC3bR2OkZCtdtg.z1bK', 'ADMIN')
                    ON CONFLICT (username) DO UPDATE SET password = EXCLUDED.password;
                    "
                '''

                // Optional: check tables
                sh 'docker exec inventory-db psql -U inventoryuser -d inventorydb -c "\\dt"'
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
