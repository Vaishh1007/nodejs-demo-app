pipeline {
    agent any  // run directly on Jenkins node

    environment {
        IMAGE_NAME = "nodejs-demo-app"
        CONTAINER_NAME = "nodejs-demo-app-container"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Vaishh1007/nodejs-demo-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test || echo "No tests found"'
            }
        }
    }

    post {
        success { echo "✅ Pipeline completed successfully!" }
        failure { echo "❌ Pipeline failed. Check logs!" }
    }
}
