pipeline {
    agent any
    // agent {
    //     label 'AGENT-1'
    // }
    options {
        disableConcurrentBuilds()
        timeout(time: 10, unit: 'SECONDS')
        ansicolor('xterm')
    }
    // parameters {
    //     string(name: 'PERSON', defaultValue: 'Github', description: 'Who should I say hello to?')

    //     text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

    //     booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')

        choice(name: 'Action', choices: ['greet', 'nogreet'], description: 'Pick something')

    //     password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
    // }
    environment {
                DEPLOY_TO = 'production'
                GREETING = 'good morning'
            }

    stages{
        stage('hello world'){
            when {
                expression {
                    param.Action == 'greet' // this stage will run if action = greet only
                }
            }
            input{
                message "should i say hello ?"
                ok "yes, you should"
            }
            steps{
                sh 'echo "hello world"'
                // sh "sleep 20"
                // echo "Hello ${params.PERSON}"

                // echo "Biography: ${params.BIOGRAPHY}"

                // echo "Toggle: ${params.TOGGLE}"

                // echo "Choice: ${params.CHOICE}"

                // echo "Password: ${params.PASSWORD}"
                echo "my env is ${DEPLOY_TO}"
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir() // this will delete workspace 
        }
        failure {
            echo "you are seeing this because job in failed"
        }
        success  {
            echo "inkem undile panuko nuvv happy ga"
        }
    }
}