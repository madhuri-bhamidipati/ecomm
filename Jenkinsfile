pipeline {
    agent any

    parameters {
        string(name: 'BRANCH', defaultValue: 'main', description: 'Git branch to build')
        choice(name: 'ENV', choices: ['dev', 'qa', 'prod'], description: 'Deployment Environment')
    }

    stages {
        stage('Clone Code') {
            steps {
                git branch: "${params.BRANCH}", url: 'https://github.com/madhuri-bhamidipati/ecomm.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building the application..."
                sh 'docker build -t ecomm-app:${BUILD_NUMBER} .'
            }
        }

        stage('Push or Save Artifact') {
            steps {
                echo "Saving artifact..."
                // Add logic to push to ECR/DockerHub if needed
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to ${params.ENV} environment"
                sh './deploy.sh ${params.ENV}'
            }
        }
    }
}


