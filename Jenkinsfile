pipeline {
    agent any

    environment {
        IMAGE_NAME = "harshit2583/gym-website"
    }

    stages {
        stage('Check Docker') {
            steps {
                script {
                    echo "Checking Docker installation..."
                    bat 'docker --version'
                }
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Harshit2583/Gym-Website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    // Using direct docker commands instead of docker plugin
                    bat 'docker build -t ${IMAGE_NAME}:${BUILD_ID} .'
                    env.IMAGE_ID = "${env.IMAGE_NAME}:${env.BUILD_ID}"
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo "Running container to test..."
                    bat 'docker run -d -p 8080:80 --name test-container ${IMAGE_ID}'
                    bat 'ping 127.0.0.1 -n 10 > nul'  // 10 second delay
                    echo "Container is running at http://localhost:8080"
                    // Add test commands here if needed
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deployment would happen here."
                    // Example deployment command:
                    // bat 'docker push ${IMAGE_ID}'
                }
            }
        }
    }

    post {
        always {
            script {
                echo "Cleaning up Docker resources..."
                bat 'docker stop test-container || echo "No container to stop"'
                bat 'docker rm test-container || echo "No container to remove"'
                bat 'docker system prune -f'
            }
        }
    }
}