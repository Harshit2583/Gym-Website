pipeline {

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
                    bat "docker build -t %IMAGE_NAME%:%BUILD_ID% ."
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo "Running container to test..."
                    bat "docker run -d -p 8080:80 --name test-container %IMAGE_NAME%:%BUILD_ID%"
                    bat "ping 127.0.0.1 -n 10 > nul" // wait approx 10 seconds
                    echo "Container is running at http://localhost:8080"
                    // Add test cases here, e.g., curl or integration tests
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deployment step (optional) would go here"
                    // Uncomment below to push to Docker Hub
                    // bat "docker login -u your-username -p your-password"
                    // bat "docker push %IMAGE_NAME%:%BUILD_ID%"
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
