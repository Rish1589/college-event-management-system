# 📦 Installation & Setup Guide

Complete guide for installing and running the College Event System locally or in the cloud.

## 🎯 Choose Your Path

- **🐍 Windows User** → [Windows Installation](#-windows-installation)
- **🍎 Mac User** → [Mac/Linux Installation](#-maclinux-installation)  
- **🐧 Linux User** → [Mac/Linux Installation](#-maclinux-installation)
- **🐳 Docker User** → [Docker Installation](#-docker-installation)
- **☁️ Cloud Deployment** → [Cloud Deployment](#%EF%B8%8F-cloud-deployment)

---

## 🪟 Windows Installation

### Prerequisites
- Windows 10/11
- Administrator access
- Internet connection

### Step-by-Step

#### 1️⃣ Install Python
1. Go to [python.org](https://www.python.org/downloads/)
2. Download Python 3.8 or higher
3. Run installer
4. ✅ **Check "Add Python to PATH"** (Important!)
5. Click "Install Now"

**Verify Installation:**
```cmd
python --version
```
Should show: `Python 3.x.x`

#### 2️⃣ Download Project
```cmd
REM Option A: Clone from GitHub
git clone <repository-url>
cd college-event-system

REM Option B: Download ZIP and extract
cd path/to/college-event-system
```

#### 3️⃣ Run Startup Script
Double-click **`start.bat`** in the project folder

OR run in Command Prompt:
```cmd
start.bat
```

**What it does:**
- ✅ Creates virtual environment
- ✅ Installs dependencies
- ✅ Creates .env file
- ✅ Starts the application

#### 4️⃣ Open in Browser
```
http://localhost:5000
```

#### 5️⃣ Login to Admin
- **Username**: `admin`
- **Password**: `admin123`

✅ **You're done!** The system is running locally.

---

## 🍎 Mac/Linux Installation

### Prerequisites
- macOS 10.14+ or Linux (Ubuntu, Debian, etc.)
- Terminal access
- Internet connection

### Step-by-Step

#### 1️⃣ Install Python (if needed)

**Mac (using Homebrew):**
```bash
brew install python3
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv
```

**Verify:**
```bash
python3 --version
```

#### 2️⃣ Download Project
```bash
# Clone from GitHub
git clone <repository-url>
cd college-event-system

# OR: Download and extract ZIP
cd path/to/college-event-system
```

#### 3️⃣ Make Script Executable
```bash
chmod +x start.sh
```

#### 4️⃣ Run Startup Script
```bash
./start.sh
```

**What it does:**
- ✅ Creates virtual environment
- ✅ Installs dependencies
- ✅ Creates .env file
- ✅ Starts the application

#### 5️⃣ Open in Browser
```
http://localhost:5000
```

#### 6️⃣ Login to Admin
- **Username**: `admin`
- **Password**: `admin123`

✅ **You're done!** The system is running locally.

---

## 🐳 Docker Installation

### Prerequisites
- Docker installed ([docker.com](https://docker.com))
- Docker Desktop for Windows/Mac OR Docker Engine for Linux
- Internet connection

### Quick Start (Single Container)

#### 1️⃣ Build Image
```bash
docker build -t event-system .
```

#### 2️⃣ Run Container
```bash
docker run -p 5000:5000 \
  -e SECRET_KEY="your-secret-key" \
  -e ADMIN_USERNAME="admin" \
  -e ADMIN_PASSWORD="admin123" \
  event-system
```

#### 3️⃣ Open in Browser
```
http://localhost:5000
```

✅ **Done!**

### Advanced (With PostgreSQL)

#### 1️⃣ Start Both Services
```bash
docker-compose up -d
```

#### 2️⃣ Check Status
```bash
docker-compose ps
```

#### 3️⃣ View Logs
```bash
docker-compose logs -f web
```

#### 4️⃣ Open in Browser
```
http://localhost:5000
```

#### 5️⃣ Stop Services
```bash
docker-compose down
```

---

## ☁️ Cloud Deployment

### 🌟 Recommended: Render.com

#### Step 1: Prepare GitHub Repository
```bash
git init
git add .
git commit -m "College Event System"
git push origin main
```

#### Step 2: Create Render Account
1. Go to [render.com](https://render.com)
2. Sign up with GitHub
3. Authorize Render to access your repos

#### Step 3: Create Web Service
1. Click "New +" → "Web Service"
2. Select your repository
3. Fill in settings:
   - **Name**: `college-event-system`
   - **Branch**: `main`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app`

#### Step 4: Add Environment Variables
Click "Environment" and add:
```
SECRET_KEY=<generate-random-key>
ADMIN_USERNAME=admin
ADMIN_PASSWORD=admin123
FLASK_ENV=production
```

**Generate SECRET_KEY** (run in Python):
```python
import secrets
print(secrets.token_hex(32))
```

#### Step 5: Deploy
Click "Deploy" button and wait 5-10 minutes

#### Step 6: Get Your URL
Once deployed, you'll get:
```
https://college-event-system-abc123.onrender.com
```

Share event links like:
```
https://college-event-system-abc123.onrender.com/event/a1b2c3d4
```

✅ **Your app is live!**

---

### 🚂 Alternative: Railway.app

#### Step 1: Create Account
1. Go to [railway.app](https://railway.app)
2. Sign up with GitHub

#### Step 2: Create New Project
1. Click "New Project"
2. Select "Deploy from GitHub repo"
3. Authorize and select your repository

#### Step 3: Add Variables
Click "Variables" and add same as Render above

#### Step 4: Done
Railway auto-deploys on git push!

Get your URL from the deployment dashboard.

---

## 🔐 Production Setup

### Change Admin Credentials

#### Option 1: Using .env File
```env
ADMIN_USERNAME=myusername
ADMIN_PASSWORD=mysecurepassword123
```

Restart the application.

#### Option 2: Direct in Database (Advanced)
```bash
sqlite3 database.db
UPDATE admins SET username='newuser', password='newpass' WHERE id=1;
```

### Generate Secure SECRET_KEY

```python
import secrets
key = secrets.token_hex(32)
print(key)
# Use this in .env
```

### Backup Database

**SQLite:**
```bash
cp database.db database.db.backup
```

**PostgreSQL:**
```bash
pg_dump -U postgres dbname > backup.sql
```

---

## ✅ Verification Checklist

After installation, verify:

- [ ] App starts without errors
- [ ] Can access http://localhost:5000
- [ ] Can login with admin credentials
- [ ] Can create an event
- [ ] Can see shareable link on dashboard
- [ ] Can register for event
- [ ] Can download QR code
- [ ] Can access admin dashboard

---

## 🐛 Troubleshooting

### "Python command not found"
**Windows:**
- Reinstall Python
- ✅ Check "Add to PATH" during installation

**Mac/Linux:**
```bash
which python3
# If not found, install via Homebrew/apt
```

### "Port 5000 already in use"
```bash
# Change port in .env
PORT=5001

# Or kill process on port 5000
# Windows: netstat -ano | findstr :5000
# Mac/Linux: lsof -i :5000
```

### "ModuleNotFoundError: No module named 'flask'"
Make sure virtual environment is activated:

**Windows:**
```cmd
venv\Scripts\activate
```

**Mac/Linux:**
```bash
source venv/bin/activate
```

### ".env file not found"
```bash
cp .env.example .env
```

### "Database locked"
This happens when multiple instances run. Close all and restart:
```bash
# Windows: Press Ctrl+C in terminal, then restart

# Mac/Linux: Ctrl+C, then restart
```

### QR Code not generating
- Check `qr_codes/` folder has write permissions
- In cloud, QR codes are generated as base64 (displayed, not saved)

---

## 📚 Next Steps

1. **Read Documentation**
   - [README.md](README.md) - Feature overview
   - [QUICK_START.md](QUICK_START.md) - 5-minute setup
   - [DEPLOYMENT.md](DEPLOYMENT.md) - Cloud deployment details

2. **Try Features**
   - Create an event
   - Register for it
   - Test QR scanning
   - Export reports

3. **Customize**
   - Change admin credentials
   - Update event templates
   - Customize styling (CSS)

4. **Deploy**
   - Follow cloud deployment guide
   - Share event links with students
   - Monitor attendance

---

## 🆘 Need Help?

**Installation Issues:**
- Check Python version: `python --version` (3.8+)
- Check dependencies: `pip list`
- Read error messages carefully (they usually help!)

**Feature Issues:**
- Check browser console (F12 → Console tab)
- Check server logs (terminal output)
- Try clearing browser cache (Ctrl+Shift+Del)

**Still Stuck?**
- Read [DEPLOYMENT.md](DEPLOYMENT.md) troubleshooting section
- Check that all environment variables are set
- Verify database exists and is not corrupted

---

## 🎉 You're All Set!

Your College Event System is now installed and ready to use:
- ✅ Locally on your computer
- ✅ In the cloud (Render/Railway)
- ✅ In Docker
- ✅ With shareable event links

**Next**: Create your first event and share the link! 🚀

Questions? Check the [docs](README.md)!
