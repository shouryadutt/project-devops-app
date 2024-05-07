pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'git', url: 'https://github.com/shouryadutt/project-devops-app'
            }
        }
        stage('Maven Build'){
            steps{
                sh 'mvn clean package'
            }
        }
    }
}
