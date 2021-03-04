pipeline {
        agent any

        stages {
//                stage('scm') {
//                        steps {
//                                git credentialsId: 'git_credential', url: 'https://gitlab.com/idrishlearning/gamutkart.git'
//                        }
//                }
                stage('build') {
                        steps {
                                sh 'mvn clean install -DskipTests'
                        }
                 }
                stage('test') {
                        steps {
                                sh 'mvn test'
                        }
                        post {
                            always {
                                junit 'target/surefire-reports/*.xml'
                            }
                        }
                }
                stage('artifact-upload') {
                        steps {
                                nexusArtifactUploader artifacts: [[artifactId: 'gamutkart', classifier: '', file: 'target/gamutkart.war', type: 'war']], credentialsId: 'nexus-credentials', groupId: 'com.gamutgurus', nexusUrl: '3.137.215.183:8081/nexus', nexusVersion: 'nexus2', protocol: 'http', repository: 'gamutkart-snapshot', version: '1.1-SNAPSHOT'
                        }
                }
        }
}
