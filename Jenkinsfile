pipeline{
    agent any
    
    
  environment {
    AWS_ACCESS_KEY_ID = credentials('accesskey')
    AWS_SECRET_ACCESS_KEY = credentials('screatkey')
    AWS_DEFAULT_REGION = 'ap-northeast-1'
  }
stages{
  stage('CheckOutCode'){
    steps{
   checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/bvenkydevops/mavenrepo-master']])
	
	}
  }

  stage('Build'){
    steps{
       sh  "mvn clean package"
         }
   }
	
   stage('sonarQube'){
    steps{
       sh  "mvn clean sonar:sonar"
         }
   }
 stage('nexus'){
    steps{
       sh  "mvn clean deploy"
         }
   }
   
stage('upload in ecr') {
	 steps {
	   script {
	          
	   withCredentials([string(credentialsId: 'acesskey', variable: 'accesskey'), 
                        string(credentialsId: 'screatkey', variable: 'screatkey')]) {
          sh 'aws configure set aws_access_key_id $accesskey'
          sh 'aws configure set aws_secret_access_key $screatkey'
          sh 'aws configure set default.region $AWS_DEFAULT_REGION'
          
          // Perform other AWS-related commands or actions here
    sh 'aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/k0d1g4g8'
    sh 'docker build -t venkyrepo .'
    sh 'docker tag venkyrepo:latest public.ecr.aws/k0d1g4g8/venkyrepo:latest'
    sh 'docker push public.ecr.aws/k0d1g4g8/venkyrepo:latest'
        }
}
}
}



}
}
