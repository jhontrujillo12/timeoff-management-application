pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'apt-get update && apt-get install -y procps'
                sh 'sudo npm install -g npm'
            }
        }
    }
}