#!/bin/bash

# Simple startup script for FastAPI backend
echo "Starting FastAPI backend..."

# Install dependencies if not already installed
pip install fastapi uvicorn sqlalchemy pydantic python-multipart

# Change to app directory
cd /home/ubuntu/app

# Make sure we have the code - pull from git or upload manually
# git clone https://github.com/yourrepo/crud-app.git .

# Start the FastAPI server
python3 -m uvicorn main:app --host 0.0.0.0 --port 8000
