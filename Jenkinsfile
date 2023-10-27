pipeline{
  agent{
      label ""
  }
  environment{
    IMAGE_NAME = "maven-app"
    TAG = "build-{BUILD_NUMBER}"
    
  }

  stages{
    stage('Build'){
      steps{
        script{
          echo"Building docker image"
          sh "docker build -t ${maven-app}:${tag} . "
          withCredentails([gitUsernamePassword(credentialsId:'github', gitToolName:'Default')]){
            sh 'git config --global user.email "akshaiakshai35@gmail.com"'
            sh 'git config --global user.name "theakshai"'
            sh 'git tag -a ${env.TAG} -m ${env.TAG}'
            sh 'git push --tags'
          }

           withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        sh "aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/s5o7d0z2"
                        SH "docker tag ${IMAGE_NAME}:${TAG} public.ecr.aws/s5o7d0z2/j${IMAGE_NAME}:${TAG}"
                        sh "docker push public.ecr.aws/s5o7d0z2/${IMAGE_NAME}:${TAG}"
                        echo "Docker Image successfully pushed to ECR"
                    }
        }
      }
    }

  }
}
