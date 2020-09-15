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
      dockerImagemy = ""
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
                    git 'http://github.com/MariiaMarkina/KubernetesHmv'
                    sh 'docker build -t mariiamarkina/devopshomework:kubepipeline_${env.BUILD_ID} /home/jenkins/agent/workspace/Homework/'
                    withDockerRegistry([ credentialsId: "dockerhubCred", url: "https://registry.hub.docker.com/" ]) {
                    sh 'docker push  mariiamarkina/devopshomework:kubepipeline_${env.BUILD_ID}'
                    }
                        
                 // script {
                //    docker.build("mariiamarkina/devopshomework:kubepipeline", '/home/jenkins/agent/workspace/Homework/')
                //    dockerImagemy = docker.build("mariiamarkina/devopshomework:kubepipeline", '/home/jenkins/agent/workspace/Homework/')
                //    docker.withRegistry('', registryCredential) 
                //    dockerImage.push()
               //     }
                }
                // sh 'serve -s build'
               // sh 'sleep 600'
            }
        }
    }
}
