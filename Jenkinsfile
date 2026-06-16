pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Detect Target') {
            steps {
                script {
                    TARGET = sh(
                        script: './scripts/detect_target.sh',
                        returnStdout: true
                    ).trim()

                    echo "Deploying to ${TARGET}"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    if (TARGET == "green") {
                        sh './scripts/deploy_green.sh'
                    } else {
                        sh './scripts/deploy_blue.sh'
                    }
                }
            }
        }

        stage('Smoke Test') {
            steps {
                sh './scripts/smoke_test.sh'
            }
        }

        stage('Switch Traffic') {
            steps {
                script {
                    if (TARGET == "green") {
                        sh './scripts/switch_green.sh'
                    } else {
                        sh './scripts/switch_blue.sh'
                    }
                }
            }
        }
    }

    post {
        failure {
            sh './scripts/rollback.sh'
        }
    }
}
