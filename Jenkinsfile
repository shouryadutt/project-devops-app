pipeline {
    agent any

    stages {
        stage('Maven Build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Tomcat Deploy'){
            steps{
                sshagent(['tomcat1']) {
                    sh "scp -o StrictHostKeyChecking=no target/devops-app.war ec2-user@${env.TOMCAT_IP}:/opt/tomcat9/webapps"
                    sh "ssh ec2-user@${env.TOMCAT_IP} /opt/tomcat9/bin/shutdown.sh"
                    sh "ssh ec2-user@${env.TOMCAT_IP} /opt/tomcat9/bin/startup.sh"
                }
            }
        }
    }
    
}
