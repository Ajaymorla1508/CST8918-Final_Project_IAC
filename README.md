CST8918 - DevOps: Infrastructure as Code  
Prof: Robert McKenney

# Weather App – Kubernetes Deployment with Redis

## 1. Project Overview
This project deploys a Remix-based Weather App to Kubernetes with:
- **Frontend + Backend** combined in a Remix app
- **Redis** for caching API responses
- **OpenWeather API** for live weather data
- **Kubernetes LoadBalancer** for public access

---

## 2. Prerequisites
Before deployment, ensure you have:
- Docker installed (with `buildx` plugin)
- Kubernetes cluster (e.g., AKS, Minikube, etc.)
- `kubectl` configured to access the cluster
- A container registry (GHCR in this case)
- OpenWeather API Key

---

## 3. Steps Performed

### Step 1 – Install Redis in Kubernetes
```sh
kubectl apply -f redis-deployment.yaml
kubectl get pods
kubectl get svc
```
- Confirmed Redis is running and accessible at: redis://redis:6379

### Step 2 – Add Redis Client in App
```bash
Installed dependencies:
npm install redis
npm install --save-dev @types/node
```
Created app/data-access/redis-connection.ts:
```ts
import { createClient } from 'redis';

const url = process.env.REDIS_URL || "redis://redis:6379";

export const redis = await createClient({ url })
  .on('error', (err: any) => console.error('Redis client connection error', err))
  .connect();
```
### Step 3 – Configure Deployment
Created deployment.yaml:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: weather-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: weather-app
  template:
    metadata:
      labels:
        app: weather-app
    spec:
      containers:
        - name: weather-app
          image: ghcr.io/<your-username>/weather-app:latest
          ports:
            - containerPort: 3000
          imagePullPolicy: Always
          env:
            - name: WEATHER_API_KEY
              value: "<your-api-key>"
            - name: REDIS_URL
              value: "redis://redis:6379"
      imagePullSecrets:
        - name: ghcr-secret
---
apiVersion: v1
kind: Service
metadata:
  name: weather-service
spec:
  type: LoadBalancer
  selector:
    app: weather-app
  ports:
    - port: 80
      targetPort: 3000
```
### step 4 – Build and Push Image
```bash
docker buildx build -t ghcr.io/<your-username>/weather-app:latest --push .
```
### Step 5 – Deploy to Kubernetes
```bash
kubectl apply -f [deployment.yaml](http://_vscodecontentref_/0)
kubectl get pods
kubectl get svc
```
Public IP assigned via LoadBalancer.
Accessible via browser.

### Step 6 – Verify Redis Cache
- First request: Logs show Cache miss — fetching from OpenWeather API…
- Second request: Logs show Cache hit.
4. Final Status
✅ Weather App deployed successfully.
✅ Redis caching works.
✅ Public access via LoadBalancer IP.

-  Example: URL: http://<external-ip>

![Weather application running successfully](.img/weather-app.png)