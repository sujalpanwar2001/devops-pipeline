pipeline {
    agent any

    tools{
        maven "Maven"
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
        stage("Quality Gate"){
            steps{
                waitForQualityGate abortPipeline: true
            }
        }
    

        // stage('Build Code'){
        //     steps{
        //         sh """
        //             cd dummyproject/
        //             mvn clean package
        //             """
        //     }
        // }

        // stage('Test Code'){
        //     steps{
        //         sh  """
        //             cd dummyproject/
        //             mvn test
        //             """
        //     }
        //     post{
        //         always{
        //             junit 'dummyproject/target/surefire-reports/*.xml'
        //         }
        //     }
        // }
    }
}

