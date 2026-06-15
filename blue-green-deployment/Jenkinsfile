pipeline {
    agent any

    stages {

        stage('Build Image') {
            steps {
                sh 'docker build -t flask-app:new .'
            }
        }

        stage('Deploy Green') {
            steps {
                sh 'chmod +x scripts/*.sh'
                sh './scripts/deploy_green.sh'
            }
        }

        stage('Smoke Test') {
            steps {
                sh './scripts/smoke_test.sh'
            }
        }

        stage('Switch Traffic') {
            steps {
                sh './scripts/switch_traffic.sh'
            }
        }
    }

    post {

        success {
            echo 'Blue-Green Deployment Successful'
        }

        failure {
            sh './scripts/rollback.sh'
            echo 'Rollback Executed'
        }
    }
}
