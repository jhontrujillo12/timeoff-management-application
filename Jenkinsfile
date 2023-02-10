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
        aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/j7m7m7b0
        docker tag repo_public_technicaltest:latest public.ecr.aws/j7m7m7b0/timeoff:latest
        docker push public.ecr.aws/j7m7m7b0/timeoff:latest
        '''
      }
    }
  }
}

