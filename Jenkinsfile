pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/madhuri-bhamidipati/ecomm.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("ecomm-static-site")
                }
            }
        }

        stage('Stop & Remove Old Container') {
            steps {
                script {
                    sh "docker rm -f ecomm-container || true"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run -d --name ecomm-container -p 80:80 ecomm-static-site"
                }
            }
        }
    }
}
