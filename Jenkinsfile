pipeline {
    agent any
    // agent {
    //     label 'AGENT-1'
    // }
    options {
        disableConcurrentBuilds()
        timeout(time: 10, unit: 'SECONDS')
    }
        parameters {
        string(name: 'Github', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')

        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')

        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')

        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
    }

    stages{
        stage('hello world'){
            steps{
                sh 'echo "hello world"'
                // sh "sleep 20"
                echo "Hello ${params.PERSON}"

                echo "Biography: ${params.BIOGRAPHY}"

                echo "Toggle: ${params.TOGGLE}"

                echo "Choice: ${params.CHOICE}"

                echo "Password: ${params.PASSWORD}"
            }
        }
    }
}