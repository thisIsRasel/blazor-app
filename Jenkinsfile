pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('thisisrasel-dockerhub')
    }
    stages {
        stage('Build') {
            steps {
                bat 'docker build -t thisisrasel/my-blazor-app:latest .'
            }
        }
        stage('Login') {
            steps {
                bat 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                bar 'docker push thisisrasel/my-blazor-app:latest'
            }
        }
    }
}
