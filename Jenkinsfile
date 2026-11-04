pipeline {
  agent any
  environment {
    IMAGE = 'pedrodelariva/ci-demo'
  }
  stages {
    stage('Build image') {
      steps {
        sh 'docker version'
        script { env.TAG = env.GIT_COMMIT.take(7) }
        sh 'docker build -t $IMAGE:$TAG .'
      }
    }
    stage('Push image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-pat', usernameVariable: 'DH_USER', passwordVariable: 'DH_PAT')]) {
          sh 'echo "$DH_PAT" | docker login -u "$DH_USER" --password-stdin'
          sh 'docker push $IMAGE:$TAG'
        }
      }
    }
  }
  post {
    always { sh 'docker logout || true' }
  }
}
