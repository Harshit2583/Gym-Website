pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', 
                url: 'https://github.com/Harshit2583/Gym-Website.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t html-app .'
    }
}

        stage('Deploy') {
            steps {
                bat 'docker run -d -p 8080:80 --name my-webapp html-app'
            }
        }
    }
}
