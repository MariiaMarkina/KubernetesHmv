// Uses Declarative syntax to run commands inside a container.
pipeline {
    
agent {
        kubernetes {
            label 'build-service-pod'
            defaultContainer 'jnlp'
            yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    job: build-service
spec:
  containers:
  - name: ubuntu
    image: ubuntu
    command: ["cat"]
    tty: true
    volumeMounts:
    - name: repository
      mountPath: /root/.m2/repository
  - name: docker
    image: docker:18.09.2
    command: ["cat"]
    tty: true
    volumeMounts:
    - name: docker-sock
      mountPath: /var/run/docker.sock
  volumes:
  - name: repository
    persistentVolumeClaim:
      claimName: repository
  - name: docker-sock
    hostPath:
      path: /var/run/docker.sock
"""
        }
    }
    options {
        skipDefaultCheckout true
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
                container ('ubuntu'){
                git 'https://github.com/americans007/react-app'
                sh 'npm install'
                sh 'npm run build'
                sh 'npm install -g serve'
                }
                }
        }
        stage('create image') {
            steps { 
                container('docker'){
              //  sh 'apt-get update'
              //  sh 'apt-get install -y gnupg'
               // sh 'apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D'
              //  sh 'apt install -y software-properties-common'
              //  sh "apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'"
              //  sh 'apt-get update'
               // sh 'apt-cache policy docker-engine'
               // sh 'apt-get install -y docker.io'
              //  sh 'hello?'
                  sh 'docker pull ubuntu'
                  sh 'docker images'
               // script {
                //  dockerImage = docker.build("mariiamarkina/devopshomework:kubepipeline${env.BUILD_ID}", '.')
                //  docker.withRegistry('', registryCredential) 
                 // dockerImage.push()
               // }
                }
                // sh 'serve -s build'
               // sh 'sleep 600'
            }
        }
    }
}
