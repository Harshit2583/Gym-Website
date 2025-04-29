pipeline {
    agent any

    environment {
        IMAGE_NAME = "gym-website"
        CONTAINER_NAME = "gym-website-container"
        PORT = "8080"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Harshit2583/Gym-Website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Cleanup Old Container') {
            steps {
                script {
                    bat """
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    """
                }
            }
        }

        stage('Deploy New Container') {
            steps {
                script {
                    bat 'docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME'
                }
            }
        }
    }
}
