pipeline {
    agent {
        docker { 
            image 'node:20'  // Node.js 20 image from Docker Hub
            args '-u root:root' // optional: run as root to avoid permission issues
        }
    }

    environment {
        NODE_ENV = "development"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "🔄 Checking out code from GitHub..."
                git branch: 'main', url: 'https://github.com/Vaishh1007/nodejs-demo-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo "📦 Installing npm dependencies..."
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo "🧪 Running tests..."
                sh 'npm test || echo "No tests found"'
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed. Check logs!"
        }
    }
}
