// Uses Declarative syntax to run commands inside a container.
pipeline {
    agent {
        kubernetes {
            yaml '''
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: shell
    image: ubuntu
    command:
    - sleep
    args:
    - infinity
'''
   
            defaultContainer 'shell'
        }
    }
    
    environment {
      registry = "mariiamarkina/devopshomework"
      registryCredential = 'dockerhubCred'
      dockerImage = ""
    }   
    
    stages {
        stage('build') {
            tools {nodejs "nodejs 14.10.1"}
            steps {  
                git 'https://github.com/americans007/react-app'
                sh 'npm install'
                sh 'npm run build'
                sh 'npm install -g serve'
                }
        }
        stage('create image') {
            steps { 
                sh 'apt-get install -y gnupg'
                sh 'apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D'
                sh "apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'"
                sh 'apt-get update'
                sh 'apt-cache policy docker-engine'
                sh 'apt-get install -y docker-engine'
                
                script {
                  dockerImage = docker.build("mariiamarkina/devopshomework:kubepipeline${env.BUILD_ID}", '/')
                  docker.withRegistry('', registryCredential) 
                  dockerImage.push()
                }
                // sh 'serve -s build'
               // sh 'sleep 600'
            }
        }
    }
}
