pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-hub-credentials')
        IMAGE_NAME = 'harshit2583/gym-website'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', 
                         branches: [[name: 'main']],
                         userRemoteConfigs: [[url: 'https://github.com/Harshit2583/Gym-Website.git']]])
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${env.BUILD_NUMBER}")
                }
            }
        }
        
        stage('Test') {
            steps {
                // Simple test to check if index.html exists
                sh 'test -f index.html && echo "index.html found" || exit 1'
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('', env.DOCKERHUB_CREDENTIALS) {
                        docker.image("${IMAGE_NAME}:${env.BUILD_NUMBER}").push()
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    sh 'docker-compose down && docker-compose up -d'
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline completed'
            // Remove cleanWs() as it was causing errors
        }
        success {
            echo 'Pipeline succeeded!'
            // Removed slackSend as you don't have the plugin installed
        }
        failure {
            echo 'Pipeline failed!'
            // Removed slackSend as you don't have the plugin installed
        }
    }
}