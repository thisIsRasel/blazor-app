pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('thisisrasel-dockerhub')
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t thisisrasel/my-blazor-app:latest .'
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push thisisrasel/my-blazor-app:latest'
            }
        }
        post {
            always {
                sh 'docker logout'
            }
        }
    }
}
