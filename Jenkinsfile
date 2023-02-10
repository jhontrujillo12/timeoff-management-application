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
   
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
      steps{  
        sh '''
        docker tag 974687818750.dkr.ecr.us-east-1.amazonaws.com/timeoff:latest
        docker push 974687818750.dkr.ecr.us-east-1.amazonaws.com/timeoff:latest
        '''
      }
    }
  }
}

