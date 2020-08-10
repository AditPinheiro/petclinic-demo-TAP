pipeline{
  environment{
    registry = "aditpinheiro/petclinic"
    registryCredential= 'docker_hub_aditpinheiro'
    dockerImage = ''
  }
  agent any //jenkins job can run on any system (windows/ubuntu)
  
  stages{
    stage ('Build'){
      steps{
        echo "Building Project"
        sh './mvnw package'
      }
    }
    stage ('Archive'){
      steps{
        echo "Archiving Project"
        archiveArtifacts artifacts: '**/*.jar', followSymlinks: false
      }
    }
    stage ('Build Docker Image'){
      steps{
        echo "Building Docker Image"
        script{
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage ('Push Docker Image'){
      steps{
        echo "Pushing Docker Image"
        script{
            docker.withRegistry( '' , registryCredential ) {
                     dockerImage.push()
          }
        }
      }
    }
    stage ('Deploy to Dev'){
      steps{
        echo "Deploying to Dev Environment"
      }
    }
  }
}
