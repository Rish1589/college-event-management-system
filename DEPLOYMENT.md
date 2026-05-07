# 🚀 Production Deployment Guide

This guide explains how to deploy your College Event System to the cloud with **shareable event links**.

## 📋 What's New

✅ **Shareable Event Links** - Each event gets a unique URL like `https://yourdomain.com/event/abc12345`
✅ **Production-Ready** - Environment variables for secrets, security improvements
✅ **Cloud Database Support** - Switch from SQLite to PostgreSQL easily
✅ **Auto QR Generation** - QR codes as base64 for better performance

---

## 1️⃣ Local Setup

### Install Dependencies
```bash
pip install -r requirements.txt
```

### Configure Environment
```bash
cp .env.example .env
```

Edit `.env` and change:
```
SECRET_KEY=your-very-secure-random-key
ADMIN_USERNAME=your-admin-username
ADMIN_PASSWORD=your-admin-password
```

Generate a secure key:
```python
import secrets
print(secrets.token_hex(32))
```

### Run Locally
```bash
python app.py
```
Visit: `http://localhost:5000`

---

## 2️⃣ Deploy to Cloud Platforms

### ✨ Option A: Deploy to **Render** (Recommended)

1. **Push code to GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git push origin main
   ```

2. **Create Render account** at [render.com](https://render.com)

3. **Create New Web Service**
   - Select GitHub repository
   - Select branch: `main`
   - Build command: `pip install -r requirements.txt`
   - Start command: `gunicorn app:app`

4. **Add Environment Variables**
   In Render dashboard → Environment:
   ```
   FLASK_ENV=production
   SECRET_KEY=<your-secret-key>
   ADMIN_USERNAME=<your-username>
   ADMIN_PASSWORD=<your-password>
   DATABASE_URL=sqlite:///database.db  (or PostgreSQL)
   ```

5. **Optional: Add PostgreSQL Database**
   - Create PostgreSQL database in Render
   - Copy `DATABASE_URL` from database dashboard
   - Paste into web service environment variables
   - Update app.py to support PostgreSQL (see PostgreSQL Setup below)

6. **Deploy**
   - Click "Deploy" and wait for build to complete
   - Your app will be live at `https://your-app-name.onrender.com`

---

### ✨ Option B: Deploy to **Railway.app**

1. **Push code to GitHub**

2. **Create Railway account** at [railway.app](https://railway.app)

3. **Connect GitHub repository**
   - Create new project
   - Select "Deploy from GitHub repo"

4. **Add Variables**
   - `FLASK_ENV=production`
   - `SECRET_KEY=<your-secret-key>`
   - `ADMIN_USERNAME=<your-username>`
   - `ADMIN_PASSWORD=<your-password>`

5. **Add PostgreSQL (optional)**
   - Add PostgreSQL plugin from Railway dashboard
   - It auto-injects `DATABASE_URL`

6. **Deploy**
   - Click "Deploy" - Railway auto-deploys on git push

---

### ✨ Option C: Deploy to **Heroku** (Free tier discontinued)

Use Render or Railway instead - they offer free tier options.

---

## 3️⃣ Using Shareable Links

### For Admins:
1. Create an event via Admin Panel
2. Each event gets an 8-character shareable code
3. On Admin Dashboard, you'll see: **Share URL**
   ```
   https://yourdomain.com/event/abc12345
   ```

### Share the Link:
- Copy and paste the URL in emails, messages, or QR code
- Anyone with this link can register for the event

### Example:
```
Admin creates: "Tech Fest 2024"
Share URL: https://youreventapp.com/event/a1b2c3d4
Send this URL to students → they register → get QR code
```

---

## 4️⃣ PostgreSQL Setup (For Production)

If using PostgreSQL:

1. **Update app.py imports** (already done):
   ```python
   from dotenv import load_dotenv
   import os
   ```

2. **Install psycopg2** (already in requirements.txt)
   ```bash
   pip install psycopg2-binary
   ```

3. **Update DATABASE_URL in .env**:
   ```
   DATABASE_URL=postgresql://user:password@host:5432/dbname
   ```

---

## 5️⃣ Environment Variables Checklist

```
✅ SECRET_KEY          - Random 64-char string
✅ FLASK_ENV           - "production"
✅ ADMIN_USERNAME      - Your admin username
✅ ADMIN_PASSWORD      - Your admin password  
✅ DATABASE_URL        - SQLite or PostgreSQL URL
✅ PORT                - (Optional, defaults to 5000)
```

---

## 6️⃣ Production Checklist

Before going live:

- [ ] Change `SECRET_KEY` to a random, secure value
- [ ] Change admin `ADMIN_USERNAME` and `ADMIN_PASSWORD`
- [ ] Set `FLASK_ENV=production`
- [ ] Use PostgreSQL database (not SQLite on shared hosting)
- [ ] Enable HTTPS (auto on Render/Railway)
- [ ] Add custom domain (optional)
- [ ] Set up daily database backups
- [ ] Monitor error logs

---

## 7️⃣ Custom Domain (Optional)

### Render:
1. Go to Settings → Custom Domain
2. Add your domain
3. Update DNS settings (detailed instructions provided)

### Railway:
1. Go to Deployments → Settings
2. Add custom domain
3. Follow DNS setup instructions

---

## 🐛 Troubleshooting

### "Event not found" when using shareable link
- Ensure database migrated properly
- Check `share_link` column exists in events table

### QR codes not displaying
- Check `qr_codes/` folder has write permissions
- In production, QR codes are generated as base64

### "Can't find admin table"
- First deployment might need manual database init
- Try visiting `/` which triggers `init_db()`

### CORS issues
- Most production platforms handle this automatically
- If issues occur, comment below Security headers section

---

## 📞 Support

**For deployment issues:**
1. Check platform logs (Render → Logs tab)
2. Verify all environment variables are set
3. Ensure `.env` is in `.gitignore` (never commit it!)

**For app issues:**
- Check browser console (F12 → Console)
- Check server logs for Python errors

---

## 🎉 You're Live!

Your event management system is now accessible worldwide with shareable links! 

Share event URLs like:
```
🔗 https://youreventapp.com/event/abc12345
```

Students can register from anywhere, and you'll get real-time attendance tracking!

---

**Next Steps:**
1. Test registration on shared link
2. Generate test QR codes
3. Test attendance scanning
4. Share event links with students
5. Monitor admin dashboard for registrations

Happy event managing! 🎓
