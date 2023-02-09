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

    stage('Push Artifactory') {
    	agent any
      steps {
        sh '''
        docker login https://technicaltest.jfrog.io -u jhontrujillo12@gmail.com -p ${JFROG_PASSWORD}
        docker push timeoff-image
        '''
      }
    }
  }
}

