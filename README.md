# Version-app

This documentation provides details for a simple Spring Boot application that exposes a single HTTP endpoint /version. The application can be built using Maven, tested with JUnit, and deployed as a Docker container.
in Kubernates cluster and infrastrecture created using terraform.


## Requirements 

Prerequisites
Java 17: Ensure that Java 17 or later is installed.
Maven: Ensure that Maven is installed to build the application.
Docker: (Optional) For containerization.


## Steps in deploying the application

write a jenkinsfile with the following steps to deploy the application and build the jenkinsfile


first Set all the environment variables required in the jenkinsfile
        imageName = "raj159/version-app"        
        registryUrl = "registry.hub.docker.com"
        registryCreds = 'docker'
        dockerImage = ''
        AZURE_CREDENTIALS = credentials('azure-service-principal') // Jenkins credential ID
        TF_VAR_client_id = "${AZURE_CREDENTIALS_USR}"
        TF_VAR_client_secret = "${AZURE_CREDENTIALS_PSW}"
        TF_VAR_subscription_id = 'your-azure-subscription-id'
        TF_VAR_tenant_id = 'your-azure-tenant-id'
        TF_VAR_aks_cluster_name = 'my-aks-cluster'
        TF_VAR_resource_group_name = 'my-resource-group'
        TF_VAR_location = 'East US'

#Step1
-
Clone the Repository:
git clone <repository-url>
cd <project-directory>

Step2
-
Build the Application:
Run the following command in the project root directory to package the application into a JAR file:
mvn clean test
mvn clean package -DskipTests=true
The JAR file will be generated in the target/ directory.

Step3
-
Building the Docker Image
Create a Dockerfile:

Ensure that the Dockerfile is present in the project root directory:

Dockerfile:
ROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/version-app-0.0.1-SNAPSHOT.jar /app/version-app.jar
EXPOSE 8080
CMD ["java", "-jar", "/app/version-app.jar"]

Build the Docker Image:

Run the following command to build the Docker image:
docker build -t ${imageName}:latest .

Push the Docker image to a container registry
docker.withRegistry("https://${registryUrl}", registryCreds) 
dockerImage.push()

Step4
-
Creating the Kubernates cluster using terraform 

write terraform file and push to github repository which includes all the file like main.tf, variables.tf, terraform.tfvars, outputs.tf, modules

Run the following commands to create the infrastrecture
Terraform Init
Terraform Plan
Trraform Apply
the kubernates cluster will be created as per the variables and values given in .tf files

Step5
-
Deploying to kubernates cluster

To deploy in k8s cluster use the following commands in jenkins 

withKubeConfig(caCertificate: '', clusterName: 'mycluster', contextName: 'mycluster', credentialsId: 'kubeconfig', namespace: 'default', restrictKubeConfigAccess: false, serverUrl: 'https://myk8scluster.com:443'){

sh 'kubectl apply -f K8s-manifests/deploy.yml'
sh 'kubectl apply -f K8s-manifests/svc.yml'




