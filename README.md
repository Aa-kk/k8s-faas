# k8s-faas
* This repo contains files used to deploy a function (docker image) using Openfaas to a kubernetes cluster on amazon eks created using eksctl.

* Function is created with the use of a docker containers by Openfaas and runs as a pod in the cluster.

* In the ekscfg.yaml file I assigned iam policies to the nodes which would be inherited by the pods running in the granting the function access to upload images into S3.


# Pre-requisites
Tools required for this project include;
1. [Docker](https://docs.docker.com/get-docker/)
2. [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
3. [kubectl](https://kubernetes.io/docs/tasks/tools/)
4. [eksctl](https://eksctl.io/introduction/?h=install#installation) 
5. [arkade](https://github.com/alexellis/arkade)
6. [faascli](https://docs.openfaas.com/cli/install/)


* Jenkins_node folder contains terraform files to deploy the jenkins server in aws which is used to implement CI/CD as it automates the Build, Push and Deploy of the function into the kubernetes cluster.

* Made use of the cloudbees aws plugin to pass aws credentials to the jenkins server, also used secrets to pass the openfaas gateway (gw) to the server and docker credentials.