# 🎓 EventHub — College Event Management System

A full-featured web application for managing college events with QR-based entry and real-time attendance tracking. **Now with shareable event links!**

## ✨ Features

### 🔗 NEW: Shareable Event Links
- Each event gets a unique shareable URL: `https://yourdomain.com/event/abc12345`
- Easy to share via email, QR codes, or messages
- One-click registration for students

### Student Side
- Browse all upcoming events
- Register with shareable links or from home page
- Receive a unique QR code after registration
- Download QR code for event entry

### Admin Side
- Secure login with customizable credentials
- Create, edit, delete events
- View all registrations per event
- Real-time QR code check-in scanner (camera-based)
- Manual QR data entry for testing
- Live attendance dashboard
- Export attendance as **CSV** or **PDF**
- Copy shareable links with one click

## 🚀 Quick Start (Local)

### 1. Install dependencies
```bash
pip install -r requirements.txt
```

### 2. Setup environment
```bash
cp .env.example .env
```

Edit `.env`:
```
SECRET_KEY=your-secure-key-here
ADMIN_USERNAME=admin
ADMIN_PASSWORD=admin123
```

### 3. Run the app
```bash
python app.py
```

### 4. Open in browser
```
http://localhost:5000
```

### 5. Admin Login
- **Username**: `admin` (or from .env)
- **Password**: `admin123` (or from .env)

---

## 🐳 Run with Docker (Recommended for Production)

### Docker (Single Container)
```bash
docker build -t event-system .
docker run -p 5000:5000 \
  -e SECRET_KEY="your-secret-key" \
  -e ADMIN_USERNAME="admin" \
  -e ADMIN_PASSWORD="admin123" \
  event-system
```

### Docker Compose (with PostgreSQL)
```bash
docker-compose up -d
```
This starts both the Flask app and PostgreSQL database.

Visit: `http://localhost:5000`

---

## 📦 Deploy to Cloud

For complete deployment guides to **Render**, **Railway**, **Heroku**, and more, see:

📖 **[DEPLOYMENT.md](DEPLOYMENT.md)** ← Read this for cloud deployment!

Quick links:
- ✅ **[Deploy to Render](DEPLOYMENT.md#-option-a-deploy-to-render-recommended)** (Recommended)
- ✅ **[Deploy to Railway.app](DEPLOYMENT.md#-option-b-deploy-to-railwayapp)**
- ✅ **[PostgreSQL Setup](DEPLOYMENT.md#-4️⃣-postgresql-setup-for-production)**

---

## 🗂️ Project Structure
```
college-event-system/
├── app.py                  # Flask backend + all routes
├── requirements.txt        # Python dependencies
├── Dockerfile              # Docker configuration
├── docker-compose.yml      # Local dev with PostgreSQL
├── Procfile                # Heroku/Render deployment
├── .env.example            # Environment variables template
├── .gitignore              # Git ignore file
├── DEPLOYMENT.md           # Cloud deployment guide
├── README.md               # This file
├── database.db             # SQLite DB (auto-created)
├── qr_codes/               # Generated QR images
├── templates/
│   ├── base.html           # Shared layout
│   ├── index.html          # Event listing page
│   ├── register.html       # Student registration
│   ├── confirmation.html   # Post-registration + QR display
│   ├── admin_login.html    # Admin auth
│   ├── admin.html          # Admin dashboard (with share links)
│   ├── event_form.html     # Create/edit event form
│   ├── registrations.html  # Per-event registrations list
│   ├── checkin.html        # QR scanner page
│   └── attendance.html     # Attendance log
└── static/
    ├── style.css
    └── script.js
```

## 🔐 Admin Credentials

Change these in production!

**Default:**
| Field | Value |
|---|---|
| Username | `admin` |
| Password | `admin123` |

**Change in .env:**
```
ADMIN_USERNAME=your-username
ADMIN_PASSWORD=your-password
```

## 📦 Tech Stack
- **Backend**: Python / Flask
- **Database**: SQLite (dev) / PostgreSQL (production)
- **QR Generation**: `qrcode[pil]`
- **PDF Export**: `reportlab`
- **QR Scanning**: `html5-qrcode` (browser camera)
- **Frontend**: HTML5 + CSS3 + Vanilla JS
- **Deployment**: Docker, Render, Railway, Heroku

## 🔄 Workflow

1. **Admin creates event** via Admin Panel
   - System auto-generates shareable link
   
2. **Share the link** with students
   - Email: "Register here: https://yourdomain.com/event/abc12345"
   - QR Code: Encode the URL
   
3. **Students register** via shareable link
   - Get unique QR code
   - Download or screenshot it
   
4. **At the event**, admin opens Check-in page
   - Scan QRs with phone camera
   - Mark attendance in real-time
   
5. **Export reports**
   - CSV for spreadsheets
   - PDF for official records

## 🔒 Security Notes

⚠️ **Before going live:**
- [ ] Change `SECRET_KEY` in .env
- [ ] Change admin username and password
- [ ] Use PostgreSQL (not SQLite) in production
- [ ] Use HTTPS (auto-enabled on Render/Railway)
- [ ] Store `.env` securely (never commit it!)

## 🐛 Troubleshooting

### "Event not found" error
- Ensure database initialized (visit home page first)
- Check `qr_codes/` directory exists

### Share link not working
- Verify `share_link` column exists in database
- Clear browser cache and try again

### QR codes not scanning
- Ensure good lighting
- Test with QR code generator first
- Use camera permission granted

### Admin login fails
- Check ADMIN_USERNAME and ADMIN_PASSWORD in .env
- Restart application after changing .env
- Check database initialized

## 📖 Documentation

- **[DEPLOYMENT.md](DEPLOYMENT.md)** — Cloud deployment guide
- **[.env.example](.env.example)** — Environment variables
- **[Dockerfile](Dockerfile)** — Docker setup
- **[docker-compose.yml](docker-compose.yml)** — Docker Compose with PostgreSQL

## 🤝 Contributing

Found a bug? Want to add a feature?
1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## 📄 License

This project is open source and available under the MIT License.

## 🎉 Get Started

1. Clone the repo
2. `cp .env.example .env`
3. `pip install -r requirements.txt`
4. `python app.py`
5. Visit `http://localhost:5000`

For production deployment, follow the [DEPLOYMENT.md](DEPLOYMENT.md) guide!

**Happy event managing! 🎓**
