pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        echo 'Building...'
        // e.g., sh 'mvn clean compile'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing...'
        // e.g., sh 'mvn test'
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploying...'
        // e.g., sh './deploy.sh'
      }
    }
  }

  post {
    always {
      echo 'Cleaning up...'
    }
    success {
      echo 'Pipeline succeeded!'
    }
    failure {
      echo 'Pipeline failed!'
    }
  }
}
