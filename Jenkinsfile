pipeline {
    agent any

    environment {
        // Define IMAGE_NAME if it's not already set
        IMAGE_NAME = 'my-gym-app'  // You can replace this with your actual image name
    }

    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    // Ensure you're using the correct syntax for Windows batch commands
                    bat "docker build -t %IMAGE_NAME% ."
                }
            }
        }

        stage('Cleanup Old Container') {
            steps {
                script {
                    // This will remove any previously running container
                    bat "docker rm -f my-webapp || exit 0"
                }
            }
        }

        stage('Deploy New Container') {
            steps {
                script {
                    // Start the new container with the updated image and port mapping
                    bat "docker run -d -p 8081:80 --name my-webapp %IMAGE_NAME%"
                }
            }
        }
    }
    
    post {
        always {
            // You can add some steps for cleanup if required after the pipeline completes
            echo 'Pipeline completed.'
        }
    }
}
