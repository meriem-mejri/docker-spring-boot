pipeline {
agent any

environment {
    IMAGE_NAME = 'meriemmejri/docker-spring-boot'
}

stages {
    stage('Build Application') {
        steps {
            bat 'mvnw.cmd clean package'
        }
    }

    stage('Build Docker Image') {
        steps {
            bat 'docker build -t %IMAGE_NAME%:%BUILD_NUMBER% .'
            bat 'docker tag %IMAGE_NAME%:%BUILD_NUMBER% %IMAGE_NAME%:latest'
        }
    }

    stage('Push to Docker Hub') {
        steps {
            withCredentials([usernamePassword(
                credentialsId: 'dockerhub-credentials',
                usernameVariable: 'DOCKERHUB_USER',
                passwordVariable: 'DOCKERHUB_TOKEN'
            )]) {
                bat 'docker login -u %DOCKERHUB_USER% -p %DOCKERHUB_TOKEN%'
                bat 'docker push %IMAGE_NAME%:%BUILD_NUMBER%'
                bat 'docker push %IMAGE_NAME%:latest'
                bat 'docker logout'
            }
        }
    }
}

}
