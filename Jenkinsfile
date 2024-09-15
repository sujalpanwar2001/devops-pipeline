pipeline {
    agent any

    tools{
        maven "Maven"
    }
    
        environment {
        EMAIL_RECIPIENTS = 'sujalpanwar2001@gmail.com'  // Change to your email recipient
    }

    stages {
        
        

        stage('Checkout Code') {
            steps {
                git branch: 'devops-assignment-branch',
                    credentialsId: 'gitlab',
                    url: 'https://git.nagarro.com/GITG00641/Java/sujal-panwar.git'
            }
        }
        
        

        stage('Build and Sonar Analysis'){
            steps{
                withSonarQubeEnv('Sonar'){
                    sh """
                     cd dummyproject/
                     mvn clean install
                     mvn sonar:sonar
                     """

                }
            }
        }

        
        
        stage('Quality Gate') {
            steps {
                script {
       

                    if ( waitForQualityGate().status == 'ERROR') {
                        // Quality gate failed, send email and then abort
                        
                        mail bcc: '', body: '''The pipeline  has failed the quality gate check as its coverage is less than 70%.
                        The quality gate status is ERROR. Please check the Jenkins console output for more details:
                              ''', cc: '', from: '', replyTo: '', subject: 'Pipeline Quality Gate Failed', to: 'sujalpanwar2001@gmail.com'

                       
                        error("Pipeline aborted due to quality gate failure")
                    }
                }
            }
        }
        
        
        
    



        stage('Test Code'){
            steps{
                sh  """
                    cd dummyproject/
                    mvn test
                    """
            }
            post{
                always{
                    junit 'dummyproject/target/surefire-reports/*.xml'
                }
            }
        }
    }
}

