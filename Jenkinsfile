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
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Cleanup Old Container') {
            steps {
                script {
                    sh """
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    """
                }
            }
        }

        stage('Deploy New Container') {
            steps {
                script {
                    sh 'docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME'
                }
            }
        }
    }
}
