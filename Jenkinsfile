pipeline {
environment { // Declaration of environment variables
DOCKER_ID = "abou67" // replace this with your docker-id
DOCKER_IMAGE = "datascientestapi"
DOCKER_TAG = "v.${BUILD_ID}.0" // we will tag our images with the current build in order to increment the value by 1 with each new build
}
agent any // Jenkins will be able to select all available agents
stages {
        stage('Build Docker Image') {  
            steps{                     
            sh 'docker-compose up -d'     
            echo 'Docker-compose-build Build Image Completed'                
            }           
        }

        // stage('Deploiement en prod'){
        //     environment {
        //         KUBECONFIG = credentials("config") // we retrieve  kubeconfig from secret file called config saved on jenkins
        //     }
        //     steps {
        //     // Create an Approval Button with a timeout of 15minutes.
        //     // this require a manuel validation in order to deploy on production environment
        //         timeout(time: 15, unit: "MINUTES") {
        //             input message: 'Do you want to deploy in production ?', ok: 'Yes'
        //         }

        //         script {
        //             sh '''
        //             rm -Rf .kube
        //             mkdir .kube
        //             ls
        //             cat $KUBECONFIG > .kube/config
        //             cp fastapi/values.yaml values.yml
        //             cat values.yml
        //             sed -i "s+tag.*+tag: ${DOCKER_TAG}+g" values.yml
        //             helm upgrade --install app fastapi --values=values.yml --namespace prod
        //             '''
        //         }
        //     }
        // }
        stage('Test Acceptance')
        {                                // we launch the curl command to validate that the container responds to the request
            steps {
                script {                // wait 3 minutes that services are up
                    sh '''
                    sleep 60 
                    '''
                }
                script {
                    int movies_result = sh (script: 'curl http://localhost:8001/api/v1/movies/docs', returnStdout: true)
                    echo "movies_result is: ${movies_result}"
                    if ($movies_result != 200 && status != 201) {
                            error("Returned status code = $movies_result")
                    }
                    else {echo "url command executed with success"}
                }
                script {
                    def casts_result = sh '''
                     curl http://localhost:8002/api/v1/casts/docs
                    '''
                    echo "casts_result is: ${casts_result}"
                }
            }
        }
    stage('Uninstall'){
           steps {
            // Create an Approval Button with a timeout of 15minutes.
            // this require a manuel validation in order to perform uninstall step
                timeout(time: 15, unit: "MINUTES") {
                    input message: 'Do you want to uninstall all ?', ok: 'Yes'
                }

                script {
                    sh 'docker-compose down' 
                }
                script {
                    sh 'docker image rm jenkins_devops_exams-ci-cd_cast_service jenkins_devops_exams-ci-cd_movie_service' 
                }   
            }
        }
    }
    post { // send email when the job has failed
        // ..
        failure {
            echo "This will run if the job failed"
            mail to: "abdelkader.boumediene@gmail.com",
                subject: "${env.JOB_NAME} - Build # ${env.BUILD_ID} has failed",
                body: "For more info on the pipeline failure, check out the console output at ${env.BUILD_URL}"
        }
        // ..
    }
}
