pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                url: 'https://github.com/Harshit2583/Gym-Website.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("harshit2583/gym-website:${env.BUILD_ID}")
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    dockerImage.withRun('-p 8080:80') { container ->
                        sleep(10) // Give container time to start
                        // You could add actual tests here
                        echo "Website is running at http://localhost:8080"
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    // For a real project, you'd push to a registry and deploy to production
                    echo "Deployment would happen here"
                    // dockerImage.push() // Uncomment when ready to push to Docker Hub
                }
            }
        }
    }
    
    post {
        always {
            // Clean up
            script {
                docker.safeImagePrune()
            }
        }
    }
}