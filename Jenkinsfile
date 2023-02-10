pipeline {
	agent any

  stages {

    stage('Docker Build') {
      steps {
      	sh 'docker build --tag timeoff:latest .'
      }
    }

    stage('Push Artifactory') {
      steps {
        sh '''
        docker login technicaltest.jfrog.io -u jhontrujillo12@gmail.com -p=cmVmdGtuOjAxOjE3MDc1MDY1MjQ6MFlQMnJCcklZVWRJQW80NmZ3anpjeXNYYWFx
        docker tag timeoff technicaltest.jfrog.io/technicaltestrepoartifactory/timeoff:latest
        docker push technicaltest.jfrog.io/technicaltestrepoartifactory/timeoff:latest
        '''
      }
    }

    stage('Building image') {
      steps{
        sh 'dockerImage = docker.build jenkins-ecr-technical-test:latest'
      }
    }
   
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
      steps{  
        sh '''
        docker tag jenkins-ecr-technical-test:latest 974687818750.dkr.ecr.us-east-1.amazonaws.com/jenkins-ecr-technical-test:latest
        docker push 974687818750.dkr.ecr.us-east-1.amazonaws.com/jenkins-ecr-technical-test:latest
        '''
      }
    }
  }
}

