pipeline {
environment { // Declaration of environment variables
DOCKER_ID = "abou67" // replace this with your docker-id
// DOCKER_IMAGE = "datascientestapi"
DOCKER_IMAGE = "movie-db"
DOCKER_TAG = "v.${BUILD_ID}.0" // we will tag our images with the current build in order to increment the value by 1 with each new build
}
agent any // Jenkins will be able to select all available agents
stages {
        // stage('Build Docker Image') {  
        //     steps{                     
        //     // sh 'docker-compose up -d'     
        //     // echo 'Docker-compose-build Build Image Completed'                
        //     }           
        //         3 - movie_service
        //         1 - movie_db
        //         4 - cast_service
        //         2 - cast_db
        //         5 - nginx              
        //}
        stage('Deploy movie-db')
        { 
              environment
                            {
                                DOCKER_PASS = 'Ph3pYT*WZwYZ#5v' // credentials("DOCKER_HUB_PASS") // we retrieve  docker password from secret text called docker_hub_pass saved on jenkins
                            }
              steps {
                      script {                // build Deploy movie_db
                                sh '''
                                    // docker build -t movie-db
                                    docker login -u $DOCKER_ID -p $DOCKER_PASS
                                    docker build -t $DOCKER_ID/$DOCKER_IMAGE:$DOCKER_TAG .
                                '''
                        }
                }
        }
        // stage('Test Acceptance')
        // {                                // we launch the curl command to validate that the container responds to the request
        //     steps {
        //         script {                // wait 3 minutes that services are up
        //             sh '''
        //             sleep 60
        //             '''
        //         }
        //         script {                // Create entries: name: abdelkader & nationality: dataScienst
        //                 sh '''
        //                    curl -X 'POST' \
        //                           'http://localhost:8001/api/v1/movies/' \
        //                           -H 'accept: application/json' \
        //                           -H 'Content-Type: application/json' \
        //                           -d '{
        //                                   "name": "move",
        //                                   "plot": "story",
        //                                   "genres": [
        //                                     "Action"
        //                                   ],
        //                                   "casts_id": [
        //                                     1
        //                                   ]
        //                         }'
        //              '''

        //         }
        //         script {                // Create entries: name: abdelkader & nationality: dataScienst
        //                 sh '''
        //                    curl -X 'POST' \
        //                   'http://localhost:8002/api/v1/casts/' \
        //                   -H 'accept: application/json' \
        //                   -H 'Content-Type: application/json' \
        //                   -d '{
        //                   "name": "abdelkader",
        //                   "nationality": "DataScienst"
        //                 }'
        //              '''
        //         }
        //         script {
        //             def movies_result = sh(script: "curl http://localhost:8001/api/v1/movies/1/", returnStdout: true)
        //             // echo "movies_result is: $movies_result"
        //             // if ($movies_result != 200 && status != 201) {
        //             //         error("Returned status code = $movies_result")
        //             // }
        //             echo "movies_result result is: " + movies_result
        //             //echo "movies name is: $movies_result["name"] " // $movies_result{"name"}" 
        //             if ( movies_result == '{"name":"move","plot":"story","genres":["Action"],"casts_id":[1],"id":1}') {
        //                     echo "movies_result result is ok: " + movies_result
        //             }
        //                 else {
        //                         echo "movies_result result is NOT ok: $movies_result"
        //                 }
                    
        //         }
        //         script {
        //             def casts_result = sh(script: "curl http://localhost:8002/api/v1/casts/1/", returnStdout: true)
                            
        //             echo "casts_result is: " + casts_result
        //             if ( casts_result == '{"name":"abo","nationality":"FR","id":1}') {
        //                     echo "casts_result result is ok: " + casts_result
        //             }
        //                 else {
        //                         echo "casts_result result is NOT ok: " + casts_result
        //                 }
        //         }
        //     }
        // }
    // stage('Docker Push'){ //we pass the built image to our docker hub account
    //         environment
    //         {
    //             DOCKER_PASS = credentials("DOCKER_HUB_PASS") // we retrieve  docker password from secret text called docker_hub_pass saved on jenkins
    //         }

    //         steps {
    //             script {
    //             sh '''
    //             docker login -u $DOCKER_ID -p $DOCKER_PASS
    //             // docker push $DOCKER_ID/$DOCKER_IMAGE:$DOCKER_TAG
    //             '''
    //             }
    //         }
    //     }
    // stage('Deploiement en prod'){
    //         // environment {
    //         //    // KUBECONFIG = credentials("config") // we retrieve  kubeconfig from secret file called config saved on jenkins
    //         // }
    //         steps {
    //                         // Create an Approval Button with a timeout of 15minutes.
    //                         // this require a manuel validation in order to deploy on production environment
    //             timeout(time: 15, unit: "MINUTES") {
    //                 input message: 'Do you want to deploy in production ?', ok: 'Yes'
    //             }
    //             steps{                     
    //                     sh 'docker-compose up -d'     
    //                     echo 'Docker-compose-build Build Image Completed'                
    //                 }    
    //         }
    //     }
    // stage('Uninstall'){
    //        steps {
    //         // Create an Approval Button with a timeout of 15minutes.
    //         // this require a manuel validation in order to perform uninstall step
    //             timeout(time: 15, unit: "MINUTES") {
    //                 input message: 'Do you want to uninstall all ?', ok: 'Yes'
    //             }

    //             script {
    //                 sh 'docker-compose down' 
    //             }
    //             script {
    //                 sh 'docker image rm jenkins_devops_exams-ci-cd_cast_service jenkins_devops_exams-ci-cd_movie_service' 
    //             }   
    //         }
    //     }
}
    // post { // send email when the job has failed
    //     // ..
    //     failure {
    //         echo "This will run if the job failed"
    //         mail to: "abdelkader.boumediene@gmail.com",
    //             subject: "${env.JOB_NAME} - Build # ${env.BUILD_ID} has failed",
    //             body: "For more info on the pipeline failure, check out the console output at ${env.BUILD_URL}"
    //     }
    //     // ..
    // }
}
