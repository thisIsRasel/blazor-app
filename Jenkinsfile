pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = "thisisrasel"
    }
    stages {
        stage('Build & Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'thisisrasel-dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat "docker login -u $DOCKER_USER -p $DOCKER_PASS $DOCKER_REGISTRY"
                    bat "docker build -t $DOCKER_REGISTRY/my-blazor-app:latest ."
                    bat "docker push $DOCKER_REGISTRY/my-blazor-app:latest"
                }
            }
        }
    }
}
