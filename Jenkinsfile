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
    image: bitnami-docker-node
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
