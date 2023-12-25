pipeline {
    agent any

   environment{
       DOCKER_HUB_CREDENTIALS = credentials('Docker-login')
       DOCKER_IMAGE_NAME = 'lakshmimanoj/flask-app'
   }

    stages {
        stage('SCM checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Manoj0409/flask-application.git'
            }
        }
        
        stage('Test') {
            steps {
                sh 'pytest test.py'
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE_NAME .'
            }
        }
        
        stage('Push the image to dockerhub') {
            steps {
                sh 'echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push $DOCKER_IMAGE_NAME'
            }
        }
        
        stage('Deploy') {
            steps {
                sh 'docker run -dit --name flask -p 5000:5000 $DOCKER_IMAGE_NAME'
            }
        }
    }
}
