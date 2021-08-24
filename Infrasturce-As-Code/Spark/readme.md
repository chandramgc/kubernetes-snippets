# Create new docker image
* docker build - < Dockerfile
* docker tag <image id> srmmanjunath/spark-base-image
* docker push srmmanjunath/spark-base-image

# Build spark standlone cluster
* kubectl run spark --image=srmmanjunath/spark-base-image:latest --port=8080 --restart=Never
* kubectl expose pod spark --type=NodePort --name=spark-service

# Find spark port 
* kubectl get svc