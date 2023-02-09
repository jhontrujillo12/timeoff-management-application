pipeline {
	agent none

  environment {
    DOCKERHUB_CREDENTIALS=credentials('dockerHub')
  }

  stages {
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t timeoff-image .'
      }
    }

    stage('Login') {
      agent any
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }   

    stage('Push') {
    	agent any
      steps {
        dockerImage.Push()
      }
    }
  }
}

