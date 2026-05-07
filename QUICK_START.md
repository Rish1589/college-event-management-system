# ⚡ Quick Start Guide

Get your event system up and running in minutes!

## 🏃‍♂️ Local Setup (5 minutes)

### Step 1: Install Python Dependencies
```bash
pip install -r requirements.txt
```

### Step 2: Start the App
```bash
python app.py
```

### Step 3: Open in Browser
```
http://localhost:5000
```

### Step 4: Login to Admin Panel
- Click "Admin" or go to `/admin/login`
- **Username**: `admin`
- **Password**: `admin123`

### Step 5: Create an Event
- Click "Create Event"
- Fill in event details
- Click "Create"
- See your shareable link on the dashboard!

### Step 6: Test Registration
- Go back to home page
- Register for your event
- Get a QR code

---

## ☁️ Cloud Deployment (10 minutes)

### Option 1: Deploy to Render (Free)

1. **Push to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial"
   git push
   ```

2. **Go to [render.com](https://render.com)**
   - Sign up with GitHub
   - New → Web Service
   - Select your repository
   - Name: `event-system`
   - Build: `pip install -r requirements.txt`
   - Start: `gunicorn app:app`
   - Click Deploy

3. **Add Environment Variables** (in Render dashboard)
   - `SECRET_KEY=your-secret-key`
   - `ADMIN_USERNAME=admin`
   - `ADMIN_PASSWORD=admin123`

4. **Wait 5 minutes** for deployment
   - Your app is live at `https://event-system.onrender.com`
   - Share links like: `https://event-system.onrender.com/event/abc12345`

### Option 2: Deploy to Railway (Free)

1. **Push to GitHub**

2. **Go to [railway.app](https://railway.app)**
   - Sign up with GitHub
   - Create new project
   - Deploy from GitHub repo

3. **Add PostgreSQL** (optional, from Plugins)
   - It auto-sets `DATABASE_URL`

4. **Set Variables**
   - Same as above

5. **Done!** Railway auto-deploys

---

## 🎯 Common Tasks

### Share an Event
1. Login as admin
2. Find your event in the dashboard
3. Click the copy button next to the share link
4. Paste in email/message/QR code

### Check Attendance
1. Go to Admin Dashboard
2. Click the 📷 icon for QR check-in
3. Scan student QR codes with your phone
4. See real-time attendance

### Export Report
1. Find the event
2. Click "CSV" or "PDF"
3. Download opens in browser

### Change Admin Credentials
1. Edit `.env` file:
   ```
   ADMIN_USERNAME=newusername
   ADMIN_PASSWORD=newpassword
   ```
2. Restart the app
3. Login with new credentials

---

## 🔗 Shareable Links Explained

Each event gets a **unique shareable link**:
```
https://yourdomain.com/event/a1b2c3d4
```

When students visit this link:
- ✅ They see the event details
- ✅ They can register immediately
- ✅ They get a QR code
- ✅ One-click sharing via email/message

### How to Use Shareable Links
```
📧 Email: "Register here: https://yourdomain.com/event/a1b2c3d4"

📱 WhatsApp: "Event registration link: https://yourdomain.com/event/a1b2c3d4"

🎨 QR Code: Encode the link in a QR code

💬 Announcement: Post on college website/social media
```

---

## 📊 Admin Features at a Glance

| Feature | Where | Action |
|---------|-------|--------|
| Create Event | Dashboard → "+ Create Event" | Fill form |
| Share Event | Dashboard → Copy link | Share anywhere |
| View Registrations | Dashboard → 👥 icon | See all registrants |
| Check Attendance | Dashboard → 📷 | Scan QR codes |
| View Attendance | Dashboard → 📋 | See who attended |
| Export CSV | Dashboard → CSV | Download spreadsheet |
| Export PDF | Dashboard → PDF | Download report |
| Edit Event | Dashboard → ✏️ | Update details |
| Delete Event | Dashboard → 🗑️ | Remove event |

---

## ✅ Checklist Before Going Live

- [ ] Deploy to a cloud platform (Render/Railway)
- [ ] Change admin username & password
- [ ] Change `SECRET_KEY` to random value
- [ ] Test registration with shareable link
- [ ] Test QR code scanning
- [ ] Test attendance export
- [ ] Share event links with students
- [ ] Monitor admin dashboard during event

---

## 🆘 Troubleshooting

**"Can't connect to server"**
- Make sure app is running: `python app.py`
- Check port 5000 is available

**"Share link not working"**
- Clear browser cache (Ctrl+Shift+Del)
- Reload page

**"QR code won't scan"**
- Ensure good lighting
- Hold phone steady
- Try zooming in

**"Admin login fails"**
- Check username/password in .env
- Restart app after changing .env

**"No QR code after registration"**
- Refresh page
- Check browser console (F12 → Console)

---

## 📚 More Help

- **Full Deployment Guide**: See [DEPLOYMENT.md](DEPLOYMENT.md)
- **Environment Setup**: See [.env.example](.env.example)
- **Docker Setup**: See [docker-compose.yml](docker-compose.yml)

---

## 🎉 You're Ready!

Your event management system is now:
- ✅ Running locally
- ✅ Ready to deploy to cloud
- ✅ Ready to accept registrations
- ✅ Ready to track attendance

**Next**: Create an event and share the link! 🚀
