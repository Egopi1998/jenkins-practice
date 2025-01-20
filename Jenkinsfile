pipeline {
    agent any
    // agent {
    //     label 'AGENT-1'
    // }
    options {
        disableConcurrentBuilds()
        timeout(time: 10, unit: 'SECONDs')
    }

    stages{
        stage('hello world'){
            steps{
                sh 'echo "hello world"'
                sh "sleep 20"
            }
        }
    }
}