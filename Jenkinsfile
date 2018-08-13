pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew clean assemble'
            }
        }
        stage('UnitTest') {
            steps {
                sh './gradlew clean test jacocoTestReport check'
            }
            post {
                success {
                    junit 'build/test-results/test/*.xml'
                    publishHTML (target: [
                        allowMissing: true,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'build/reports/tests/test',
                        reportFiles: 'index.html',
                        reportName: "Test Summary"
                         ])
                    publishHTML (target: [
                        allowMissing: true,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'build/reports/coverage/',
                        reportFiles: 'index.html',
                        reportName: 'Code Coverage Report'
                         ])
                    publishHTML (target: [
                        allowMissing: true,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'build/reports/findbugs',
                        reportFiles: 'main.html',
                        reportName: "Findbugs Main Analysis"
                         ])
                    publishHTML (target: [
                        allowMissing: true,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'build/reports/findbugs',
                        reportFiles: 'test.html',
                        reportName: "Findbugs Test Analysis"
                         ])
                }
            }    
        }
        
        stage('Code Quality') {
            steps {
                sh './gradlew sonarqube -Dsonar.organization=omar-limbert-github -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=f005f31e1cc80c26275d54f377b35595a4457f86'
            }
        }
        stage('Package') {
            steps {
                sh './gradlew build capsule'
            }
            post {
                success {
                    archiveArtifacts artifacts: 'build/libs/*.jar', fingerprint: true
                }
            }
        }
        
        stage('Publish') {
            steps {
                sh './gradlew uploadArchives'
            }
            post {
                success {
                    archiveArtifacts artifacts: '**/repos/*.jar', fingerprint: true
                }
            }
            
        }
        
    }
}
