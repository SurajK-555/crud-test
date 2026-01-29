# 🐳 DOCKER - Simple Guide for Beginners

## What is Docker?
Docker is like a **lunch box** for your application:
- Your app + all its needs (Python, Node, dependencies) go in one box
- The box works the same on any computer
- No "but it works on my machine" problems!

## How Docker Works in This Project

### 1. Backend Container
```
Dockerfile.backend creates a box with:
├── Python 3.11
├── FastAPI
├── Your backend code (main.py, models.py, etc)
└── Port 8000 exposed
```

### 2. Frontend Container  
```
Dockerfile.frontend creates a box with:
├── Node.js 18
├── React built version
├── Nginx web server
└── Port 80 (or 3000 in docker-compose) exposed
```

### 3. Docker Compose
Docker Compose is a **recipe** that says:
- "Build backend container"
- "Build frontend container"  
- "Run them together"
- "Backend talks to frontend"

## Quick Commands

### Build and Run Everything (Recommended for beginners)
```bash
docker-compose -f docker-compose-simple.yml up --build
```

Then visit:
- Frontend: http://localhost:3000
- Backend API: http://localhost:8000/docs

### Stop everything
```bash
docker-compose -f docker-compose-simple.yml down
```

### See running containers
```bash
docker ps
```

### See logs (for debugging)
```bash
docker-compose -f docker-compose-simple.yml logs backend
docker-compose -f docker-compose-simple.yml logs frontend
```

## Why Docker?
✅ One command to run everything
✅ Works on Windows, Mac, Linux
✅ Easy to deploy to the cloud
✅ Deploy the same way everywhere

## Learning Resources
- Docker basics: https://docs.docker.com/guides/getting-started/
- Docker Compose: https://docs.docker.com/compose/
