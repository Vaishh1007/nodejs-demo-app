# Node.js Demo App – CI/CD with GitHub Actions & Docker

This is a very simple Node.js application containerized with Docker and connected to a GitHub Actions CI/CD pipeline.

---

## 📌 What this repo shows
- A **basic Node.js app** (`index.js`)
- A **Dockerfile** to containerize the app
- A **GitHub Actions workflow** (`.github/workflows/main.yml`) for CI/CD

---

## ⚡ How the pipeline works
- The workflow is triggered **manually** (not on every push)  
- When run, it will:
  1. Checkout the repo
  2. Log in to Docker Hub (using secrets)
  3. Build a Docker image
  4. Push the image to Docker Hub

👉 Currently the pipeline is set to **manual trigger only** (`workflow_dispatch`) to avoid errors.  
👉 To actually run it, you need to add GitHub Secrets:  
- `DOCKERHUB_USERNAME`  
- `DOCKERHUB_TOKEN` (Docker Hub Access Token or password)  
- `DOCKERHUB_REPO` (e.g. `username/nodejs-demo-app`)

---

## 🖥️ Run locally
```bash
# Install dependencies
npm install

# Start app
npm start
Visit: http://localhost:3000

```

## 🐳 Run with Docker
```bash
docker build -t nodejs-demo-app .
docker run -p 3000:3000 nodejs-demo-app
Then open: http://localhost:3000

```

## 🎯 Notes

This project is for learning DevOps CI/CD concepts as a fresher.

The workflow is ready but will not run until you configure secrets in GitHub.

Once secrets are set, you can trigger the workflow manually from the Actions tab.

