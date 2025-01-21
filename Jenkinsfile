pipeline 
{
      environment { // Declaration of environment variables
                      DOCKER_ID = "abou67" // replace this with your docker-id
                      // DOCKER_IMAGE = "datascientestapi"
                      DOCKER_IMAGE = "movie-db"
                      DOCKER_TAG = "v.${BUILD_ID}.0" // we will tag our images with the current build in order to increment the value by 1 with each new build
                      NAMESPACE="q"
                      DOCKER_PASS = credentials("DOCKER_HUB_PASS") // we retrieve  docker password from secret text called docker_hub_pass saved on jenkins
                      KUBECONFIG = credentials("config") // we retrieve  kubeconfig from secret file called config saved on jenkins
              }
      agent any // Jenkins will be able to select all available agents
      stages 
      {
              
              //         1 - movie_db
              //         2 - cast_db
              //         3 - movie_service
              //         4 - cast_service
              //         5 - nginx              
              //
              stage('Deploy movie-db')
              { 
                      environment
                                  {
                                      DOCKER_IMAGE = "movie_db"
                                  }
                      steps {
                            script 
                            {                // build Deploy movie_db with postgres:12.1-alpine
                                      sh '''
                                          cd movie-service
                                          docker build -t $DOCKER_ID/$DOCKER_IMAGE .
                                          cd ~
                                      '''
                          }
                          script 
                          {
                               push_image_docker_hub ("$DOCKER_ID/$DOCKER_IMAGE")
                          }
                    }
              }
              stage('Deploy cast-db')
              { 
                    environment
                                  {
                                      DOCKER_IMAGE = "cast_db"
                                  }
                    steps {
                            script 
                            {                // build Deploy cast_db with postgres:12.1-alpine
                                      sh '''
                                          cd cast-service
                                          docker build -t $DOCKER_ID/$DOCKER_IMAGE .
                                          cd ~
                                      '''
                          }
                          script 
                          {
                               push_image_docker_hub ("$DOCKER_ID/$DOCKER_IMAGE")
                          }
                    }
              }
              stage('Deploy movie_service')
              {
                       steps
                       {
                            script 
                            {
                                  sh '''
                                  ls ./movie-service
                                  '''
                            }
                      }
              }
              stage('Deploy Service to Kubernetes') 
              {
                   environment 
                  {
                          //KUBECONFIG = credentials('kubeconfig-credential-id') // Remplacez par l'ID Jenkins du kubeconfig
                          SERVICE_YAML = 'movie-service-service.yaml' // Nom du fichier contenant la définition du service
                          NAMESPACE = 'qa' // Namespace cible
                  } 
                  steps 
                  {
                      script 
                      {
                          // Vérifier que le fichier YAML existe dans le dépôt
                          sh "ls -l ${SERVICE_YAML}"
                          
                          // Appliquer le fichier YAML dans le namespace spécifié
                          //withKubeConfig([credentialsId: 'kubeconfig-credential-id']) 
                          //{
                              sh "kubectl apply -f ${SERVICE_YAML} -n ${NAMESPACE}"
                          //}
                      }
              }
          }
          stage('Deploy movie-service') 
          {
                  environment
                  {
                                HELM_HOME = '/usr/local/bin/helm' // Path to the Helm binary
                                KUBECONFIG = credentials('kubeconfig-credential-id') // Jenkins kubeconfig credentials ID
                                HELM_RELEASE_NAME = 'move-service' // Helm release name
                                NAMESPACE = 'qa' // Target namespace
                                CHART_DIR = './movie-service' // Path to Helm chart directory
                  }
                  steps 
                  {
                      script 
                      {
                              sh """
                              rm -Rf .kube
                              mkdir .kube
                              cat $KUBECONFIG > .kube/config
                              helm upgrade --install ${HELM_RELEASE_NAME} ${CHART_DIR} \
                              --namespace ${NAMESPACE} \
                              --set namespace=${NAMESPACE}
                              """
                     }
                }
          }
        stage('Deploy cast-service') 
          {
                  environment
                  {
                                HELM_HOME = '/usr/local/bin/helm' // Path to the Helm binary
                                KUBECONFIG = credentials('kubeconfig-credential-id') // Jenkins kubeconfig credentials ID
                                HELM_RELEASE_NAME = 'cast-service' // Helm release name
                                NAMESPACE = 'qa' // Target namespace
                                CHART_DIR = './cast-service' // Path to Helm chart directory
                  }
                  steps 
                  {
                      script 
                      {
                              sh """
                              rm -Rf .kube
                              mkdir .kube
                              cat $KUBECONFIG > .kube/config
                              helm upgrade --install ${HELM_RELEASE_NAME} ${CHART_DIR} \
                              --namespace ${NAMESPACE} \
                              --set namespace=${NAMESPACE}
                              """
                     }
                }
          }
      } // END_stages
    //   post 
    //   { // send email when the job has failed
    //     // ..
    //     failure 
    //     {
    //         echo "This will run if the job failed"
    //         mail to: "abdelkader.boumediene@gmail.com",
    //             subject: "${env.JOB_NAME} - Build # ${env.BUILD_ID} has failed",
    //             body: "For more info on the pipeline failure, check out the console output at ${env.BUILD_URL}"
    //   }
    // } // END_ post
} // END_pipeline
      
//------------------ ------------------ ------------------  
//------------------------ Functions ---------------------
//------------------ ------------------ ------------------ 
// ------------------- pull image
def push_image_docker_hub (image)
{
    stage('Docker Push image: ' + image)
    {
        script 
        {
            echo "----- pushing image " + image 
        }
        script 
        {
            echo "----- pushing image " + image 
        }
        script 
        {
                sh '''
                docker login -u $DOCKER_ID -p $DOCKER_PASS
                docker push $DOCKER_ID/$DOCKER_IMAGE
                '''
        }
   }
}
