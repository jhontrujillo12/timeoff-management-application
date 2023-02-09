pipeline {
	agent any

  stages {
    stage('Docker Build') {
      steps {
      	sh 'docker build -t timeoff-image .'
      }
    }

    stage('Push Artifactory') {
      steps {
        sh '''
        docker login technicaltest.jfrog.io -u jhontrujillo12@gmail.com -p=cmVmdGtuOjAxOjE3MDc1MDY1MjQ6MFlQMnJCcklZVWRJQW80NmZ3anpjeXNYYWFx
        docker push timeoff-image
        '''
      }
    }
  }
}

