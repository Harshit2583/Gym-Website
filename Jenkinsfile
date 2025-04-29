pipeline {
    agent any

    environment {
        IMAGE_NAME = "harshit2583/gym-website"
    }

    // Declare dockerImage at top level to be accessible in all stages
    def dockerImage

    stages {
        stage('Check Docker') {
            steps {
                script {
                    echo "Checking Docker installation..."
                    sh 'docker --version'
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
                    try {
                        echo "Building Docker image..."
                        dockerImage = docker.build("${env.IMAGE_NAME}:${env.BUILD_ID}")
                        echo "Built image: ${env.IMAGE_NAME}:${env.BUILD_ID}"
                    } catch (err) {
                        echo "Docker build failed: ${err}"
                        error("Stopping pipeline due to Docker build failure.")
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo "Running container to test..."
                    dockerImage.withRun('-p 8080:80') { container ->
                        sleep(10) // Allow container to start
                        echo "Container is running at http://localhost:8080"
                        // You can add actual health checks or curl commands here
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deployment would happen here."
                    // To push to Docker Hub (when ready):
                    // docker.withRegistry('', 'docker-hub-credentials-id') {
                    //     dockerImage.push("${env.BUILD_ID}")
                    // }
                }
            }
        }
    }

    post {
        always {
            script {
                echo "Cleaning up Docker resources..."
                sh 'docker system prune -f'
            }
        }
    }
}
