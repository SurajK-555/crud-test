import React, { useState, useEffect } from 'react';
import { itemsAPI } from './api';
import './App.css';

function App() {
  const [items, setItems] = useState([]);
  const [form, setForm] = useState({ title: '', description: '', price: '' });
  const [editingId, setEditingId] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  useEffect(() => {
    fetchItems();
  }, []);

  const fetchItems = async () => {
    try {
      setLoading(true);
      const response = await itemsAPI.getAll();
      setItems(response.data);
      setError('');
    } catch (err) {
      setError('Failed to fetch items');
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setForm({ ...form, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!form.title || !form.description || !form.price) {
      setError('Please fill in all fields');
      return;
    }

    try {
      if (editingId) {
        await itemsAPI.update(editingId, {
          ...form,
          price: parseInt(form.price),
        });
        setEditingId(null);
      } else {
        await itemsAPI.create({
          ...form,
          price: parseInt(form.price),
        });
      }
      setForm({ title: '', description: '', price: '' });
      fetchItems();
      setError('');
    } catch (err) {
      setError('Failed to save item');
      console.error(err);
    }
  };

  const handleEdit = (item) => {
    setForm({
      title: item.title,
      description: item.description,
      price: item.price.toString(),
    });
    setEditingId(item.id);
  };

  const handleDelete = async (id) => {
    if (window.confirm('Are you sure you want to delete this item?')) {
      try {
        await itemsAPI.delete(id);
        fetchItems();
        setError('');
      } catch (err) {
        setError('Failed to delete item');
        console.error(err);
      }
    }
  };

  const handleCancel = () => {
    setForm({ title: '', description: '', price: '' });
    setEditingId(null);
    setError('');
  };

  return (
    <div className="App">
      <h1>CRUD Application</h1>
      
      {error && <div className="error">{error}</div>}
      
      <div className="container">
        <div className="form-section">
          <h2>{editingId ? 'Edit Item' : 'Add New Item'}</h2>
          <form onSubmit={handleSubmit}>
            <input
              type="text"
              name="title"
              placeholder="Title"
              value={form.title}
              onChange={handleInputChange}
            />
            <textarea
              name="description"
              placeholder="Description"
              value={form.description}
              onChange={handleInputChange}
              rows="4"
            ></textarea>
            <input
              type="number"
              name="price"
              placeholder="Price"
              value={form.price}
              onChange={handleInputChange}
            />
            <div className="button-group">
              <button type="submit" className="btn btn-primary">
                {editingId ? 'Update' : 'Add'} Item
              </button>
              {editingId && (
                <button
                  type="button"
                  onClick={handleCancel}
                  className="btn btn-secondary"
                >
                  Cancel
                </button>
              )}
            </div>
          </form>
        </div>

        <div className="items-section">
          <h2>Items List</h2>
          {loading ? (
            <p>Loading...</p>
          ) : items.length === 0 ? (
            <p>No items found</p>
          ) : (
            <div className="items-grid">
              {items.map((item) => (
                <div key={item.id} className="item-card">
                  <h3>{item.title}</h3>
                  <p>{item.description}</p>
                  <p className="price">${item.price}</p>
                  <div className="button-group">
                    <button
                      onClick={() => handleEdit(item)}
                      className="btn btn-edit"
                    >
                      Edit
                    </button>
                    <button
                      onClick={() => handleDelete(item.id)}
                      className="btn btn-delete"
                    >
                      Delete
                    </button>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default App;
