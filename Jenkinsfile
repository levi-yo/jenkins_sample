pipeline {
    agent none

//     environment {
//         AUTHOR = 'levi.yoon'
//     }

    stages {
        stage('example build') {
            steps {
                echo 'jenkins sample build ! ${AUTHOR}'
            }
        }
    }
    post {
        always {
            echo 'post process !'
        }
    }
}