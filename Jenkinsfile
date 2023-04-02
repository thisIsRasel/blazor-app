pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = "docker.io"
    }
    stages {
        stage('Build') {
            steps {
                bat 'eval $(minikube docker-env)'
                
                bat "docker build -t thisisrasel/my-blazor-app:latest ."
            }
        }
        stage('Build & Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'thisisrasel-dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                    bat "docker push thisisrasel/my-blazor-app:latest"
                }
            }
        }
        stage('Deploy') {
            steps {
                bat 'kubectl apply -f kubernetes-deployment.yaml'
            }
        }
    }
}
