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
        sh 'docker login -ujhontrujillo12@gmail.com technicaltest.jfrog.io'
      }
    }
  }
}

