pipeline {
  agent any
    
  tools {nodejs "node"}
    
  stages {
    stage('Git') {
      steps {
        git 'https://github.com/jhontrujillo12/timeoff-management-application.git'
      }
    }
     
    stage('Build') {
      steps {
        ah 'npm install sqlite3'
        sh 'npm install'
      }
    }  
  }
}