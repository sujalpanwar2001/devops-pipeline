pipeline {
    agent any

    tools{
        maven "Maven"
        jfrog 'jfrog'
    }
    
        environment {
        EMAIL_RECIPIENTS = 'sujalpanwar2001@gmail.com'  // Change to your email recipient
         ARTIFACTORY_ACCESS_TOKEN = credentials('artifactory-access-token')
    }

    stages {
        
        

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-token-new',
                    url: 'https://github.com/sujalpanwar2001/devops-assignment.git'
            }
        }


                stage('build') {
            steps {
                sh ' mvn clean package'
            }
        }
        
        
        

        // stage('Build and Sonar Analysis'){
        //     steps{
        //         withSonarQubeEnv('Sonar'){
        //             sh """
        //              mvn clean install
        //               mvn sonar:sonar
        //              """

        //         }
        //     }
        // }

        
        
        // stage('Quality Gate') {
        //     steps {
        //         script {
       

        //             if ( waitForQualityGate().status == 'ERROR') {
        //                 // Quality gate failed, send email and then abort
                        
        //                 mail bcc: '', body: '''The pipeline  has failed the quality gate check as its coverage is less than 70%.
        //                 The quality gate status is ERROR. Please check the Jenkins console output for more details:
        //                       ''', cc: '', from: '', replyTo: '', subject: 'Pipeline Quality Gate Failed', to: 'sujalpanwar2001@gmail.com'

                       
        //                 error("Pipeline aborted due to quality gate failure")
        //             }
        //         }
        //     }
        // }
        
        
        
    



        // stage('Test Code'){
        //     steps{
        //         sh  """
        //             mvn test
        //             """
        //     }
        //     post{
        //         always{
        //             junit 'target/surefire-reports/*.xml'
        //         }
        //     }
        // }
    // }



        //     // Upload to Artifactory Stage
        // stage('Upload to Artifactory') {
        //     steps {
        //         sh 'jf rt upload "/var/lib/jenkins/workspace/assignment-pipeline-github/target/*.jar" "dummyproject/${BUILD_NUMBER}/" '
        //     }
        // }

                // Upload to Artifactory Stage
        stage('Upload to Artifactory') {
            steps {
                sh 'jf rt upload --url http://192.168.29.163:8082/artifactory/ --access-token ${ARTIFACTORY_ACCESS_TOKEN} /var/lib/jenkins/workspace/assignment-pipeline-github/target/*.jar  dummyproject/'
            }
        }
}

}