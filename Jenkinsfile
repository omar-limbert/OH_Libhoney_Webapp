pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
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
                sh './gradlew sonarqube -Dsonar.host.url=http://10.28.135.234:9000'
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
        stage('Deploy') {
            steps {
                sh './gradlew -b deploy.gradle deploy -Pdev_server=10.28.135.58 -Puser_server=ubuntu -Pkey_path=/var/jenkins_home/omy.pem -Pjar_path=build/libs -Pjar_name=libhoney-java-example-webapp-1.0.2-capsule -Puser_home=/home/ubuntu'
            }
        }
        stage('Acceptance') {
            steps {
                sh './acceptance/gradlew clean test allureReport -p acceptance/'
            }
            post {
                success {
                    publishHTML (target: [
                        allowMissing: true,
                        alwaysLinkToLastBuild: false,
                        keepAll: true,
                        reportDir: 'acceptance/build/allure-results',
                        reportFiles: 'index.html',
                        reportName: "Allure Report"
                         ])
                }
            }
        }
        
    }
}
