# React + FastAPI CRUD Application

A full-stack CRUD application with a React frontend and FastAPI backend.

## Project Structure

```
Proj/
├── backend/           # FastAPI Python backend
│   ├── main.py       # Main FastAPI application
│   ├── models.py     # SQLAlchemy ORM models
│   ├── schemas.py    # Pydantic schemas for validation
│   ├── database.py   # Database configuration
│   └── requirements.txt
└── frontend/         # React frontend
    ├── src/
    │   ├── App.js    # Main React component
    │   ├── App.css   # Styling
    │   ├── api.js    # API client
    │   └── index.js
    ├── public/
    └── package.json
```

## Features

- **Create**: Add new items with title, description, and price
- **Read**: Display all items in a grid layout
- **Update**: Edit existing items
- **Delete**: Remove items with confirmation

## Prerequisites

- Python 3.8+
- Node.js 14+
- npm or yarn

## Backend Setup

1. Navigate to the backend directory:
```bash
cd backend
```

2. Create a virtual environment:
```bash
python -m venv venv
```

3. Activate the virtual environment:
   - **Windows**:
   ```bash
   venv\Scripts\activate
   ```
   - **macOS/Linux**:
   ```bash
   source venv/bin/activate
   ```

4. Install dependencies:
```bash
pip install -r requirements.txt
```

5. Run the FastAPI server:
```bash
uvicorn main:app --reload
```

The backend will be available at `http://localhost:8000`

## Frontend Setup

1. In a new terminal, navigate to the frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm start
```

The frontend will open at `http://localhost:3000`

## API Endpoints

- `GET /items` - Get all items
- `GET /items/{id}` - Get a specific item
- `POST /items` - Create a new item
- `PUT /items/{id}` - Update an item
- `DELETE /items/{id}` - Delete an item

## API Documentation

Once the backend is running, visit `http://localhost:8000/docs` for interactive API documentation (Swagger UI).

## Usage

1. Start the backend server
2. Start the frontend development server
3. Fill in the form with item details (title, description, price)
4. Click "Add Item" to create a new item
5. Edit items by clicking the "Edit" button
6. Delete items by clicking the "Delete" button

## Database

The application uses SQLite for data persistence. The database file (`items.db`) is created automatically in the backend directory when the server starts.
