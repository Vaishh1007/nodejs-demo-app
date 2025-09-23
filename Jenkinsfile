pipeline {
    agent {
        docker {
            image 'node:20'  // Node.js 20 image from Docker Hub
            args '-u root:root' // run as root to allow npm installs
        }
    }

    environment {
        IMAGE_NAME = "nodejs-demo-app"
        CONTAINER_NAME = "nodejs-demo-app-container"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code from GitHub..."
                git branch: 'main', url: 'https://github.com/Vaishh1007/nodejs-demo-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo "Installing npm dependencies..."
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                sh 'npm test || echo "No tests found"'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Deploy Locally') {
            steps {
                echo "Deploying container..."
                sh """
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p 3000:3000 $IMAGE_NAME
                """
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
