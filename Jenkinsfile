pipeline{
    agent any
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
   /*
   stage('nexus'){
    steps{
       sh  "mvn clean deploy"
         }
   }
	*/
}
}
