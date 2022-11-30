pipeline {
    agent any
    environment {
        registry = "bar"
    }
    parameters {
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Pick something')
    }
    stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/lnachmias/php-k8s-pipeline']]])            

          }
        }
        
        stage ("Docker Build & Push") {
            steps {
                script {
                CREATED_REPO = "lnachmias/php-webserver-example"
                echo "URL of the newly created repository -->  ${CREATED_REPO}"
                } 
                sh ("docker build -t app-image .")
                sh ("docker tag app-image:latest ${CREATED_REPO}:latest")
                sh ("docker push ${CREATED_REPO}:latest")
            }   
        }

    }
}