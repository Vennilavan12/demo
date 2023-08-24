pipeline {
  agent any 
   environment {
    dockerImage=''
    DOCKERHUB_CREDENTIALS = 'docker'
    registry="vennilavan/pythonflask_app"
  } 
  stages {
    stage ('Checkout') {
      steps { 
        checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Vennilavan12/demo.git']])
        echo "Checkoutdone"
      }
    }
    stage ('Build') {
      steps {
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage ('Push Image to Dockerhub') {
      steps {  
        script {
          docker.withRegistry('', DOCKERHUB_CREDENTIALS ) {
            dockerImage.push("latest")
          }
        } 
      }
    }
    stage('Deploying Flask container to Kubernetes') {
      steps {
        kubeconfig(credentialsId: 'k8s', serverUrl: 'https://192.168.49.2:8443') {
           sh("kubectl apply -f k8s/development/deployment.yaml")
           sh("kubectl -apply -f k8s/development/service.yaml")
        }
      }
    }
 } 
}
