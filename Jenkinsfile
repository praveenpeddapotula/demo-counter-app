pipeline{
    
    agent {
        label 'AGENT-1'
    }
    
    tools {
        maven 'maven3'
        jdk 'JDK17'
        docker 'Docker'
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
        // stage('Static code analysis'){
            
        //     steps{
                
        //         script{
                    
        //             withSonarQubeEnv(credentialsId: 'sonar-api') {
                        
        //                 sh 'mvn clean package sonar:sonar'
        //             }
        //            }
                    
        //         }
        //     }
        //     stage('Quality Gate Status'){
                
        //         steps{
                    
        //             script{
                        
        //                 waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api'
        //             }
        //         }
        //     }
        stage('Docker Image Build'){
            steps{
                script{
                    sh 'docker image build -t demo-app .'
                }
            }
        }
        }
        
}


