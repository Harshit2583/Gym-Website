pipeline {
    agent any

    environment {
        IMAGE_NAME = 'gym-nginx'
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
                    echo "Building Docker image using docker-compose..."
                    sh 'docker-compose -f docker-compose.yml up --build -d'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo "Running container to test..."
                    sh 'docker ps'  // List running containers for verification
                    echo "Container is running at http://localhost:8080"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deployment would happen here..."
                    // For example, pushing the Docker image to Docker Hub (if needed)
                    // sh 'docker push gym-nginx'
                }
            }
        }
    }

    post {
        always {
            script {
                echo "Cleaning up Docker resources..."
                sh 'docker-compose down'  // Stops and removes the container
            }
        }
    }
}
