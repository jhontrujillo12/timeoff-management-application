pipeline {
	agent any

  environment {
      AWS_ACCOUNT_ID="974687818750"
      AWS_DEFAULT_REGION="us-east-1"
      IMAGE_REPO_NAME="jenkins-ecr-technical-test"
      IMAGE_TAG="latest"
      REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
    }

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

    stage('Logging into AWS ECR') {
      steps {  
        sh 'aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com'
      }
    }

    stage('Building image') {
      steps{
        sh 'dockerImage = docker.build "${IMAGE_REPO_NAME}:${IMAGE_TAG}'
      }
    }
   
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
      steps{  
        sh '''
        docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG
        docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}
        '''
      }
    }
  }
}

