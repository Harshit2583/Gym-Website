pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Harshit2583/Gym-Website.git'
            }
        }

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

        stage('Deploy New Container') {
            steps {
                bat 'docker run -d -p 8080:80 --name my-webapp html-app'
            }
        }
    }
}
