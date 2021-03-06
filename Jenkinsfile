pipeline {
    agent any
    tools {
       maven 'maven3'
    }
    stages {
        stage('Clone the code') {
            steps {
                git 'https://github.com/devops-easy/game-of-life.git'
            }
        }
        stage('Build') {
            steps {
               sh script: 'mvn clean package'
            }
        }
        stage('Upload war to nexus') {
            steps {
                script {
                    def mavenPom = readMavenPom file: 'pom.xml'
                    def nexusRepoName = mavenPom.version.endsWith("SNAPSHOT") ? "gameoflife-snapshot" : "gameoflife-release"
                    nexusArtifactUploader artifacts: 
                    [
                        [
                    artifactId: 'gameoflife', 
                    classifier: '', 
                    file: "gameoflife-web/target/gameoflife.war", 
                    type: 'war'
                    ]
                    ], 
                    credentialsId: 'nexus3_pass', 
                    groupId: 'com.wakaleo.gameoflife', 
                    nexusUrl: '172.31.16.215:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: nexusRepoName, 
                    version: "${mavenPom.version}"
                }
            }
            stage('Sonar Qube Quality Test') {
                steps {
                    // performing sonarqube analysis with "withSonarQubeENV(<Name of Server configured in Jenkins>)"
                   withSonarQubeEnv('sonar') {
                   // requires SonarQube Scanner for Maven 3.2+
                    sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar'
                       }

                }
            }
        }
    }
}