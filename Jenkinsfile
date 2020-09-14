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
    tools {nodejs "nodejs 14.10.1"}
    
    stages {
        stage('build') {
            steps {  
                git 'https://github.com/americans007/react-app'
                sh 'npm install'
                sh 'npm run build'
                sh 'npm install -g serve'
                script {
                  dockerImage = docker.build("mariiamarkina/devopshomework:kubepipeline${env.BUILD_ID}", '/')
                  docker.withRegistry('', registryCredential) {
                  dockerImage.push()
                }
            
                sh 'serve -s build'
               // sh 'sleep 600'
            }
        }
    }
}
