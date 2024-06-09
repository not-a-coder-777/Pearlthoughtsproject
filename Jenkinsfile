pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        ECR_REPOSITORY_URI = 'https://us-east-1.console.aws.amazon.com/ecr/repositories/public/170234408691/ptapp2?region=us-east-1'
        IMAGE_TAG = 'latest'
        AWS_ACCOUNT_ID = '170234408691'
        AWS_CREDENTIALS = 'mycred-id'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/not-a-coder-777/Pearlthoughtsproject.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry("https://${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com", "${AWS_CREDENTIALS}") {
                        def appImage = docker.build("${ECR_REPOSITORY_URI}:${IMAGE_TAG}")
                        appImage.push()
                    }
                }
            }
        }

        stage('Deploy to ECS') {
            steps {
                script {
                    withAWS(credentials: "${AWS_CREDENTIALS}", region: "${AWS_DEFAULT_REGION}") {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
