pipeline {
    agent none

    environment {
        SLACK_CHANNEL = '#jenkins_notification'
    }

    stages {
        stage('Start') {
            steps {
                slackSend (channel: SLACK_CHANNEL, color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
            }
        }

        stage('Build & Test') {
            agent {
                docker {
                    image 'gradle:6.0-jdk13'
                    alwaysPull true
                }
            }
            steps {
                sh '''
                    gradle -version
                '''
            }
            post {
                always {
                    echo 'Test and Build post process !'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'jenkins sample deploy ! '
            }
        }

    }
    post {
        success {
            slackSend (channel: SLACK_CHANNEL, color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
        failure {
            slackSend (channel: SLACK_CHANNEL, color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
        }
    }
}