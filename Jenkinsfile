pipeline {
  agent any
  stages {
    stage('Build image') {
      steps {
        sh 'docker version'
        sh 'docker build -t pedrodelariva/ci-demo:wip .'
      }
    }
  }
}
