pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = "docker.io"
    }
    stages {
        stage('Build & Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'thisisrasel-dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                    bat "docker build -t thisisrasel/my-blazor-app:latest ."
                    bat "docker push thisisrasel/my-blazor-app:latest"
                }
            }
        }
    }
}
