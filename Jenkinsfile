pipeline{
    
    agent any
    
    tools {
        maven 'maven3'
        jdk 'JDK17'
    }
    environment {
        IMAGE_NAME = 'praveenpeddapotula/demo-counter-app'
    }
    
    stages {
        
        stage('Git Checkout'){
            
            steps{
                
                script{
                    
                    git branch: 'main', url: 'https://github.com/praveenpeddapotula/demo-counter-app.git'
                }
            }
        }
        stage('UNIT testing'){
            
            steps{
                
                script{
                    
                    sh 'mvn test'
                }
            }
        }
        stage('Integration testing'){
            
            steps{
                
                script{
                    
                    sh 'mvn verify -DskipUnitTests'
                }
            }
        }
        stage('Maven build'){
            
            steps{
                
                script{
                    
                    sh 'mvn clean install'
                }
            }
        }
        stage('Docker build'){
            agent {
        label 'AGENT-1'
        }
            steps{
                script{
                    sh 'docker --version'
                    docker.withRegistry('https://index.docker.io/v1/', 'Docker-token'){
                    docker.build("${IMAGE_NAME}:latest")
                    }
                }
            }
        }
             }
}


