pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t html-app .'
            }
        }
        stage('Cleanup Old Container') {
            steps {
                bat 'docker rm -f my-webapp || exit 0'
            }
        }
        stage('Deploy') {
            steps {
                bat 'docker run -d -p 8080:80 --name my-webapp html-app'
            }
        }
    }
}
