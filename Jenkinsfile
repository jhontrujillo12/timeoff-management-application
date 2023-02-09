pipeline {
	agent none

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
        sh 'docker login technicaltest.jfrog.io -u ${JFROG_USER} -p ${JFROG_PASSWORD}'
      }
    }
  }
}

