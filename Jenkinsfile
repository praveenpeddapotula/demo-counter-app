pipeline{
    
    agent {
        label 'AGENT-1'
    }
    
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
                    
                    sh 'mvn verify -DskipTests'
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
       
            steps{
                script{
                    sh 'docker --version'
                    docker.withRegistry('https://index.docker.io/v1/', 'Docker-jenkins-token'){
                    docker.build("${IMAGE_NAME}:${env.BUILD_NUMBER}")
                    }
                }
            }
        }
        stage('Docker push image'){
        
            steps{
                script{
                    docker.withRegistry('https://index.docker.io/v1/', 'Docker-jenkins-token'){
                        sh "docker push ${IMAGE_NAME}:${env.BUILD_NUMBER}"
                    }
                }
            }
        }
        stage('Docker run container'){
            
            steps{
                script{
                    sh "docker run -d --name demo-container-app -p 8080:8080 ${IMAGE_NAME}:${env.BUILD_NUMBER}"
                }
            }
            
        }
             }
}


