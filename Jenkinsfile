pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew clean assemble'
            }
        }
        stage('Unittest') {
            steps {
                sh './gradlew clean test jacocoTestReport check'
            }
        }
        stage('Code Quality') {
            steps {
                sh './gradlew sonarqube -Dsonar.organization=devops_at06 -Dsonar.host.url=https://sonarcloud.io  -Dsonar.login=f5645e581c153ea97ba859e24669e95f857d6be3'
            }
        }
        stage('Publish') {
            steps {
                sh './gradlew uploadArchives'
            }
        }
    }
    post {
       always {
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
                archiveArtifacts artifacts: '**/repos/*.jar', fingerprint: true, onlyIfSuccessful: true


        }
    }
}
