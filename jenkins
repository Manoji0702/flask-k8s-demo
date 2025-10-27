pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "manoj0207/flask-k8s-demo"
    TF_VAR_image = "manoj0207/flask-k8s-demo"
  }

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/manoj0207/flask-k8s-demo.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $DOCKER_IMAGE .'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh """
            echo $PASS | docker login -u $USER --password-stdin
            docker push $DOCKER_IMAGE
          """
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        withCredentials([file(credentialsId: 'kubeconfig-cred-id', variable: 'KUBE_CONFIG')]) {
          sh """
            cd terraform
            terraform init
            terraform apply -auto-approve -var="image=$TF_VAR_image" -var="kubeconfig_path=$KUBE_CONFIG"
          """
        }
      }
    }
  }
}

