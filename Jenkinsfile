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
                    dockerImage = docker.build("${env.IMAGE_NAME}:${env.BUILD_ID}")
                    // Save image ID for reuse in next stages
                    env.IMAGE_ID = "${env.IMAGE_NAME}:${env.BUILD_ID}"
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo "Running container to test..."
                    def builtImage = docker.image(env.IMAGE_ID)
                    builtImage.withRun('-p 8080:80') { container ->
                        // On Windows, we need to use ping for delay instead of sleep
                        bat 'ping 127.0.0.1 -n 10 > nul'  // 10 second delay
                        echo "Container is running at http://localhost:8080"
                        // You can add actual tests like:
                        // bat 'curl --fail http://localhost:8080'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deployment would happen here."
                    // Uncomment and configure to push:
                    // docker.withRegistry('', 'docker-hub-credentials-id') {
                    //     docker.image(env.IMAGE_ID).push()
                    // }
                }
            }
        }
    }

    post {
        always {
            script {
                echo "Cleaning up Docker resources..."
                bat 'docker system prune -f'
            }
        }
    }
}