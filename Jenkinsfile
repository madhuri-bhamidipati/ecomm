pipeline {
  agent any

  parameters {
    string(name: 'ENV', defaultValue: 'dev', description: 'Target environment')
  }

  stages {
    stage('Deploy to EC2') {
      steps {
        sshagent(credentials: ['ec2-ssh-key']) {
          sh """
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@http://34.200.74.53/ ./deploy.sh'
              rm -rf ~/ecomm-app || true
              git clone https://github.com/madhuri-bhamidipati/ecomm-app.git
              cd ecomm-app
              chmod +x deploy.sh
              ./deploy.sh ${ENV}
            '
          """
        }
      }
    }
  }



