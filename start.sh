#!/bin/bash

# College Event System - Startup Script

echo "🎓 College Event System Startup"
echo "================================"
echo ""

# Check if .env exists
if [ ! -f .env ]; then
    echo "⚠️  .env file not found!"
    echo "Creating .env from .env.example..."
    cp .env.example .env
    echo "✅ .env created. Please edit it if needed."
    echo ""
fi

# Check Python
if ! command -v python &> /dev/null && ! command -v python3 &> /dev/null; then
    echo "❌ Python not found. Please install Python 3.8+"
    exit 1
fi

# Use python3 if available, else python
PYTHON_CMD=$(command -v python3 &> /dev/null && echo python3 || echo python)

echo "✅ Python found: $PYTHON_CMD"
echo ""

# Check if venv exists
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    $PYTHON_CMD -m venv venv
    echo "✅ Virtual environment created"
    echo ""
fi

# Activate venv
echo "🔄 Activating virtual environment..."
source venv/bin/activate
echo "✅ Virtual environment activated"
echo ""

# Install requirements
echo "📥 Installing dependencies..."
$PYTHON_CMD -m pip install -q -r requirements.txt
echo "✅ Dependencies installed"
echo ""

# Run app
echo "🚀 Starting application..."
echo "📍 Visit: http://localhost:5000"
echo "👤 Admin Login: admin / admin123"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

$PYTHON_CMD app.py
