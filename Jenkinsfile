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
                    nexusArtifactUploader artifacts: 
                    [
                      [
                    artifactId: 'gameoflife',
                    classifier: '', 
                    file: "gameoflife-web/target/gameoflife-${mavenPom.version}.war",
                    type: 'war'
                     ]
                     ],
                    credentialsId: 'nexus3_pass',
                    groupId: 'com.wakaleo.gameoflife',
                    nexusUrl: '172.31.4.229:8081',
                    nexusVersion: 'nexus3',
                    protocol: 'http',
                    repository: 'gameoflife-release',
                    version: "${mavenPom.version}"
                }
            }
        }
    }
}