pipeline{
   agent any
   tools{
    maven "m1"
    
   }
   environment{
        imageName = "raj159/version-app"        
        registryUrl = "registry.hub.docker.com"
        registryCreds = 'docker'
        dockerImage = ''
    }
   stages{
        stage("mvn test"){
            steps{
            sh 'mvn clean test'
            }
        }
        stage('mvn package'){
            steps{
                sh 'mvn clean package -DskipTests=true'
            }
        }
        stage('Build Docker Image') {
            steps {
                        dockerImage = docker.build imageName
                    }
                }
        stage('Push Docker Image') {
            steps {
                // Push the Docker image to a container registry
                script {
                    docker.withRegistry("https://${registryUrl}", registryCreds) {
                        dockerImage.push()
                    }
                }
            }
        }
}
}
