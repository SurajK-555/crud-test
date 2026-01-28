# Quick Start Guide

## 1. Backend Setup

Open a terminal and run:

```bash
cd backend
python -m venv venv
venv\Scripts\activate  # Windows
pip install -r requirements.txt
uvicorn main:app --reload
```

**Backend runs at**: http://localhost:8000

## 2. Frontend Setup

Open a new terminal and run:

```bash
cd frontend
npm install
npm start
```

**Frontend opens at**: http://localhost:3000

## 3. Test the Application

1. Fill the form with item details
2. Click "Add Item"
3. See items in the grid below
4. Click "Edit" to modify or "Delete" to remove

That's it! Your CRUD app is ready to use.
