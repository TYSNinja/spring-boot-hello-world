pipeline {
  environment {
    imagename = "tkyls/spring-boot-hello-world"
    registryCredential = 'tkyls-dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
 //       git([url: 'https://github.com/TYSNinja/spring-boot-hello-world.git', branch: 'master', credentialsId: 'TYSNinja-github-user-token'])
 	checkout scm

      }
    }
    stage('Building image') {
      steps{
     
      sh "echo AWSKEY && sleep 10"


          }
      }
   
    
    
  }
}
