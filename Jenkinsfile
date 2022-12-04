pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/deploy']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/lnachmias/php-k8s-pipeline']]])            

          }
        }
        
        stage ("Docker Build & Push") {
            steps {
                script {
                CREATED_REPO = "lnachmias/php-webserver-example"
                echo "URL of the newly created repository -->  ${CREATED_REPO}"
                echo "URL of the current build # -->  ${BUILD_NUMBER}"
                } 
                sh ("docker build -t app-image .")
                sh ("docker tag app-image:latest ${CREATED_REPO}:${BUILD_NUMBER}")
                sh ("docker push ${CREATED_REPO}:${BUILD_NUMBER}")
            }   
        }
        stage('Apply Kubernetes Files') {
            steps {
                sh 'kubectl delete -f deployment.yaml'
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f services.yaml'
            }
        }
    }
}