pipeline {
  environment {
    registry = "aditpinheiro/petclinic"
    registryCredential = 'aditpinheiro_dockerhub'
    dockerImage = ''
  }
  agent any
  stages{
    stage ('Build') {
      steps{
        echo "Building Project"
        sh './mvnw package'
      }
    }
    stage ('Archive') {
      steps{
        echo "Archiving Project"
        archiveArtifacts artifacts: '**/*.jar', followSymlinks: false
      }
    }
    stage ('Build Docker Image') {
      steps{
        echo "Building Docker Image"
        echo "new code"
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    /*stage ('Push Docker Image') {
      steps{
        echo "Pushing Docker Image"
        script {         
          docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
              dockerImage.push('latest')
          }
        }
      }
    }*/
    stage ('Deploy to Dev') {
      steps{
        echo "Deploying to Dev Environment"
        sh "docker rm -f petclinic || true"
        sh "docker run -it -d --name=petclinic -p 8082:8080 '${registry}:${BUILD_NUMBER}'"
      }
    }
  }
}
