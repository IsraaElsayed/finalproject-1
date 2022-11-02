######  terrafrom code Consists of three modules

network module: create network infrastructure two subnets private (management,restricted) and two nat for(vm , cluster)

gke module : to create private cluster in restricted subnet

jenkins module: to deploy jenkins on k8s

How to run terrafrom code

terrform init 

terraform apply

#####################################
(install jenkins in cluster)


connect to cluster

gcloud container clusters get-credentials cluster_name --zone zone_name--project project_id

create namespace

kubectl create namespace jenkins

kubectl apply -f jenkins.yml --namespace jenkins

kubectl get services --namespace jenkins    ---> then use externalip to open jenkins

kubectl get pods -n jenkins

kubectl logs <jenkins-pod-id>  -n jenkins       -----> to known password for jenkins
  
