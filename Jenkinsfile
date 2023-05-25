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
	stage('nexus_artifactupload'){
    steps{
	nexusArtifactUploader artifacts: [[artifactId: 'studentapp', classifier: '', file: 'target/studentapp-2.5-SNAPSHOT.war', type: 'war']], credentialsId: 'deployment', groupId: 'com.jdevs', nexusUrl: 'http://18.177.136.26:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'student', version: '${env.BUILD_ID}'
}
}
}
}
