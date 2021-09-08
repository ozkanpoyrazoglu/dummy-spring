pipeline {
    agent any
    
    stages {
        
        stage('SCM Checkout'){
            steps{
                git branch: 'jenkins', url: 'https://github.com/ozkanpoyrazoglu/dummy-spring.git'
            }
        }
        
        
        stage('Get Build Number'){
            steps{
                sh '''echo $BUILD_NUMBER
'''
            }
        }
        
        stage('Docker Build Image'){
            steps{
                sh 'docker build -t ozkantestapp:$BUILD_NUMBER .'
            }
        }
        
        stage('Run Image'){
            steps{
                sh 'docker run -d --name ozkantestapp_$BUILD_NUMBER ozkantestapp:$BUILD_NUMBER'
            }
        }
        
        stage('Warmup'){
            steps{
                sh 'sleep 700'
            }
        }
        
        stage('Check Latest Image'){
            steps{
                sh '''docker exec ozkantestapp_$BUILD_NUMBER curl -v localhost:8080
exitstatus=$?'''
            }
        }

        stage('Deploy Image to ECR'){
            steps{
                sh '''aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 434134839217.dkr.ecr.eu-west-2.amazonaws.com
docker tag ozkantestapp:$BUILD_NUMBER 434134839217.dkr.ecr.eu-west-2.amazonaws.com/ozkantestapp2:$BUILD_NUMBER
docker push 434134839217.dkr.ecr.eu-west-2.amazonaws.com/ozkantestapp2:$BUILD_NUMBER
docker tag ozkantestapp:$BUILD_NUMBER 434134839217.dkr.ecr.eu-west-2.amazonaws.com/ozkantestapp2:latest
docker push 434134839217.dkr.ecr.eu-west-2.amazonaws.com/ozkantestapp2:latest
'''
            }
        }
    
    }
}
