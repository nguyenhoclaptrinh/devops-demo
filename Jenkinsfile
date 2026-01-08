pipeline {
  agent any

  stages {

    stage('Checkout') {
      steps {
        // Jenkins tự động checkout mã nguồn từ GitHub (do cấu hình SCM)
        echo 'Checkout source code from GitHub (auto)'
      }
    }

    stage('Build') {
      steps {
        // Build Docker image từ Dockerfile
        sh 'docker build -t devops-nodejs .'
      }
    }

    stage('Deploy') {
      steps {
        // Xóa container cũ nếu tồn tại và chạy container mới
        sh '''
          docker rm -f devops-nodejs || true
          docker run -d -p 3000:3000 --name devops-nodejs devops-nodejs
        '''
      }
    }
  }
}