pipeline {
    agent { dockerfile true }
    stages {
        stage('Build') {
            steps {
                sh 'mvn --version'
                echo "Build"          
            }
        }
    }
}