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
                        // dockerImage = docker.build imageName
                        sh "docker build -t ${imageName}:latest ."
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
        stage('Deploy to k8s') {
            steps{
                script{
                    withKubeConfig(caCertificate: '', clusterName: 'mycluster', contextName: 'mycluster', credentialsId: 'kubeconfig', namespace: 'default', restrictKubeConfigAccess: false, serverUrl: 'https://myk8scluster.com:443') {

                    sh 'kubectl apply -f K8s-manifests/deploy.yml'
                    sh 'kubectl apply -f K8s-manifests/svc.yml'
                }
            }
        }
        }
        stage('getting LoadBalencer IP') {
            steps{
                script{
                    withKubeConfig(caCertificate: '', clusterName: 'mycluster', contextName: 'mycluster', credentialsId: 'kubeconfig', namespace: 'default', restrictKubeConfigAccess: false, serverUrl: 'https://myk8scluster.com:443') {

                    sh 'kubectl get svc --namespace default -o wide'
                    
                }
            }
        }
}
}
}

