pipeline {
	agent none

  environment {
    CI = true
    ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory')
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
        sh 'jfrog rt upload --url https://technicaltest.jfrog.io/artifactory/technicaltestrepoartifactory/ --access-token ${ARTIFACTORY_ACCESS_TOKEN} timeoff-image technicaltestrepoartifactory'
      }
    }
  }
}

