### Run a container
```
kubectl run nginx-pod --image=nginx:1.16 --restart=Never
```

### Run a job
```
kubectl run nginx-pod --image=nginx:1.16 --restart=OnFailure
```

### Log into kubernetes
```
kubectl exec ubuntu-sleeper -it -- bash
```

### Generate files
```
kubectl create deploy nginx-app --image nginx:1.17.0 --dry-run -o yaml > nginx-deployment.yaml
kubectl expose deploy nginx-app --name=nginx-service --port=80 --type=LoadBalancer --selector="app=nginx-app" --dry-run -o yaml > nginx-service.yaml
```

### Create a deployment 
```
kubectl create deploy nginx-app --image nginx:1.17.0 && kubectl label --overwrite deploy nginx-app app=nginx-app && kubectl scale deploy nginx-app --replicas 1 
kubectl expose deploy nginx-app --name=nginx-service --port=80 --type=LoadBalancer --selector="app=nginx-app" --dry-run -o yaml > nginx-service.yaml
```


### Set images in deployment
```
kubectl set deployment/myapp-deployment nginx:1.1.2
```

```
cat << eof >> throw-dice-job.yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: throw-dice-job
spec:
  completions: 3
  parallelism: 3
  backoffLimit: 25 # This is so the job does not quit before it succeeds.
  template:
    spec:
      containers:
        - name: math-add
          image: kodekloud/throw-dice
      restartPolicy: Never
eof
```
```
cat << eof >> throw-dice-cron-job.yaml
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: throw-dice-cron-job
spec:
  schedule: "30 21 * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: hello
              image: kodekloud/throw-dice
          restartPolicy: OnFailure
eof
```
Examples:
  # Start a nginx pod.
  kubectl run nginx --image=nginx

  # Start a hazelcast pod and let the container expose port 5701.
  kubectl run hazelcast --image=hazelcast/hazelcast --port=5701

# Start a hazelcast pod and set environment variables "DNS_DOMAIN=cluster" and "POD_NAMESPACE=default" in the
  container.
  kubectl run hazelcast --image=hazelcast/hazelcast --env="DNS_DOMAIN=cluster" --env="POD_NAMESPACE=default"

  # Start a hazelcast pod and set labels "app=hazelcast" and "env=prod" in the container.
  kubectl run hazelcast --image=hazelcast/hazelcast --labels="app=hazelcast,env=prod"

  # Dry run. Print the corresponding API objects without creating them.
  kubectl run nginx --image=nginx --dry-run=client

# Start a nginx pod, but overload the spec with a partial set of values parsed from JSON.
kubectl run nginx --image=nginx --overrides='{ "apiVersion": "v1", "spec": { ... } }'

  # Start a busybox pod and keep it in the foreground, don't restart it if it exits.
  kubectl run -i -t busybox --image=busybox --restart=Never

  # Start the nginx pod using the default command, but use custom arguments (arg1 .. argN) for that command.
  kubectl run nginx --image=nginx -- <arg1> <arg2> ... <argN>

  # Start the nginx pod using a different command and custom arguments.
  kubectl run nginx --image=nginx --command -- <cmd> <arg1> ... <argN>

