pipeline {
    agent any

    environment {
        SOURCE_DIR = "${WORKSPACE}"
        BUILD_DIR = "build_output"
        DEPLOY_DIR = "/var/www/html"
    }

    stages {
        stage('Build') {
            steps {
                echo "🔨 Starting Build Stage"
                sh "rm -rf ${BUILD_DIR}"
                sh "mkdir -p ${BUILD_DIR}"
                sh "rsync -av --exclude='${BUILD_DIR}' ${SOURCE_DIR}/ ${BUILD_DIR}/"
                echo "✅ Build Completed"
            }
        }

        stage('Deploy') {
            steps {
                echo "🚀 Starting Deploy Stage"
                sh "sudo rm -rf ${DEPLOY_DIR}/*"
                sh "sudo cp -r ${BUILD_DIR}/* ${DEPLOY_DIR}/"
                sh "sudo systemctl restart nginx"
                echo "✅ Deployment Done"
            }
        }
    }
}

