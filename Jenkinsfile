pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Docker') {
            steps {
                sh 'docker -v'
            }
        }
    }
}
