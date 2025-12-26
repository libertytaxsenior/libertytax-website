# GitHub Codespaces Deployment Guide
## Deploy Without Installing Anything on Your Computer

This guide shows you how to deploy your Liberty Strategic Tax Advisory website using **GitHub Codespaces** - a cloud-based development environment that runs entirely in your browser. **No Node.js installation required on your computer.**

---

## 📋 What You'll Need

1. **GitHub Account** (free) - [Sign up here](https://github.com/signup)
2. **Vercel Account** (free) - [Sign up here](https://vercel.com/signup) - Use "Continue with GitHub"
3. **Your zip file** (liberty-strategic-tax-advisory-site-updated-about.zip)
4. **30-45 minutes** of time
5. **Modern web browser** (Chrome, Firefox, Safari, or Edge)

---

## 🚀 Step 1: Create GitHub Repository

### 1.1 Sign In to GitHub

1. Go to [github.com](https://github.com)
2. Sign in (or create account if new)

### 1.2 Create New Repository

1. Click the **"+"** icon in top-right corner
2. Select **"New repository"**
3. Fill in details:
   - **Repository name**: `liberty-tax-advisory`
   - **Description**: "Liberty Strategic Tax Advisory Website"
   - **Privacy**: Select **Private** (recommended for business site)
   - **DO NOT CHECK** any boxes (no README, no .gitignore, no license)
4. Click **"Create repository"**

You'll see a page with setup instructions - **ignore these for now**.

---

## 📤 Step 2: Upload Your Files to GitHub

### 2.1 Upload Zip Contents

1. On your repository page, look for **"uploading an existing file"** link (or click "Add file" → "Upload files")
2. **Extract your zip file** on your computer first (unzip it to a folder)
3. Open the extracted folder
4. **Select ALL files and folders** inside (Ctrl+A or Cmd+A)
5. **Drag and drop** them into the GitHub upload area

**What you should see uploading:**
- `src/` folder
- `public/` folder
- `package.json`
- `README.md`
- `next.config.mjs`
- `tsconfig.json`
- `tailwind.config.ts`
- `postcss.config.js`
- `.env.example`
- Other config files

### 2.2 Commit Upload

1. Scroll down to "Commit changes" section
2. In the text box, type: `Initial commit - Liberty Tax website`
3. Click **"Commit changes"** (green button)

### 2.3 Verify Upload

After upload completes, you should see:
- File/folder list on repository page
- `src`, `public`, `package.json` visible
- Green checkmark or "Latest commit" message

---

## 💻 Step 3: Open GitHub Codespaces

### 3.1 Launch Codespace

1. On your repository page, click the **"Code"** button (green button)
2. Click the **"Codespaces"** tab
3. Click **"Create codespace on main"**

**What happens next:**
- GitHub creates a cloud computer for you
- A VS Code editor opens in your browser
- Takes 1-3 minutes to set up
- **You're now in a full development environment** - no installation needed!

### 3.2 Wait for Setup

You'll see a loading screen that says "Setting up your codespace..."

When ready, you'll see:
- A code editor (looks like VS Code)
- File explorer on the left
- Terminal at the bottom

---

## 🔧 Step 4: Set Up Your Project in Codespace

### 4.1 Open Terminal

If you don't see a terminal at the bottom:
1. Click **"Terminal"** in top menu
2. Select **"New Terminal"**

You'll see a command prompt that looks like:
```
@username ➜ /workspaces/liberty-tax-advisory (main) $
```

### 4.2 Install Dependencies

In the terminal, type this command and press Enter:

```bash
npm install
```

**What this does**: Downloads all required packages for your website

**What you'll see**:
- Lots of text scrolling by
- "added XXX packages" message
- Takes 1-2 minutes
- Should end without errors

**If you see warnings**: That's OK - warnings are fine, errors are not.

### 4.3 Create Environment File

Type these commands one at a time:

```bash
cp .env.example .env.local
```

Then edit the file:

```bash
code .env.local
```

**A file will open in the editor.** Change these values:

```env
NEXT_PUBLIC_SUITEDASH_PORTAL_URL=https://clients.friersoncfo.com
NEXT_PUBLIC_ULTIMATETAX_URL=https://YOUR-ACTUAL-ULTIMATETAX-URL
NEXT_PUBLIC_PAYPAL_CLIENT_ID=YOUR-ACTUAL-PAYPAL-CLIENT-ID
```

**Replace**:
- `YOUR-ACTUAL-ULTIMATETAX-URL` with your real UltimateTax portal URL
- `YOUR-ACTUAL-PAYPAL-CLIENT-ID` with your PayPal client ID (or leave as-is if you don't have PayPal yet)

**Save the file**: Press `Ctrl+S` (Windows) or `Cmd+S` (Mac)

### 4.4 Test Build

In the terminal, run:

```bash
npm run build
```

**What this does**: Creates a production-ready version of your website

**What you'll see**:
- Build progress messages
- "Compiled successfully" message
- Takes 30-60 seconds

**If you see errors**: Something is wrong with the code. Copy the error message and we can troubleshoot.

**If successful**: You'll see something like:
```
✓ Compiled successfully
✓ Collecting page data
✓ Generating static pages
```

---

## 🌐 Step 5: Deploy to Vercel from Codespace

### 5.1 Install Vercel CLI

In the terminal, type:

```bash
npm install -g vercel
```

Wait for installation to complete (30 seconds).

### 5.2 Login to Vercel

Type:

```bash
vercel login
```

**What you'll see**:
```
Vercel CLI XX.X.X
? Log in to Vercel
  Continue with GitHub
  Continue with GitLab
  Continue with Bitbucket
  Continue with Email
```

**Select**: `Continue with GitHub` (use arrow keys, press Enter)

**What happens**:
1. A message appears: "Verify your authentication at [URL]"
2. **Click the URL** or copy/paste it into a new browser tab
3. GitHub authorization page opens
4. Click **"Authorize Vercel"**
5. Return to Codespace terminal
6. You'll see: "Congratulations! You are now logged in."

### 5.3 Deploy Your Site

In the terminal, type:

```bash
vercel
```

**You'll be asked several questions. Answer them:**

#### Question 1: "Set up and deploy?"
```
? Set up and deploy "~/workspaces/liberty-tax-advisory"? [Y/n]
```
**Answer**: Press `Y` then `Enter`

#### Question 2: "Which scope?"
```
? Which scope do you want to deploy to?
```
**Answer**: Select your username/account, press `Enter`

#### Question 3: "Link to existing project?"
```
? Link to existing project? [y/N]
```
**Answer**: Press `N` then `Enter` (we're creating new project)

#### Question 4: "Project name?"
```
? What's your project's name? (liberty-tax-advisory)
```
**Answer**: Press `Enter` to accept default (or type a custom name)

#### Question 5: "In which directory is your code located?"
```
? In which directory is your code located? ./
```
**Answer**: Press `Enter` (accept default `./`)

#### Question 6: "Auto-detected settings"
```
Auto-detected Project Settings (Next.js):
- Build Command: next build
- Development Command: next dev --port $PORT
- Install Command: npm install
- Output Directory: .next
? Want to modify these settings? [y/N]
```
**Answer**: Press `N` then `Enter` (settings are correct)

### 5.4 Wait for Deployment

**What you'll see**:
```
🔗  Linked to username/liberty-tax-advisory
🔍  Inspect: https://vercel.com/username/project/...
✅  Production: https://liberty-tax-advisory-xyz.vercel.app
```

**This is your live website URL!** Copy it.

**Deployment takes 2-3 minutes.**

---

## 🎉 Step 6: Verify Your Site is Live

### 6.1 Test the URL

1. Copy the Production URL from terminal (looks like `https://liberty-tax-advisory-xyz.vercel.app`)
2. Open it in a new browser tab
3. **Your website should load!**

### 6.2 Check All Pages

Click through and verify:
- ✅ Homepage loads
- ✅ Services page works
- ✅ About page loads
- ✅ Pricing page works
- ✅ Forms pages load
- ✅ Navigation works
- ✅ Styling looks correct

### 6.3 Test Forms

1. Go to a form page (e.g., Engagement Letter)
2. Try filling it out
3. Submit and verify PDF generation works

**If something doesn't work**: See Troubleshooting section below.

---

## ⚙️ Step 7: Add Environment Variables to Vercel

The environment variables (`.env.local`) only exist in Codespace. You need to add them to Vercel for your production site.

### 7.1 Go to Vercel Dashboard

1. Open new tab: [vercel.com/dashboard](https://vercel.com/dashboard)
2. Find your project: `liberty-tax-advisory`
3. Click on it

### 7.2 Add Environment Variables

1. Click **"Settings"** tab
2. Click **"Environment Variables"** in left sidebar
3. Add each variable:

**Variable 1:**
- **Key**: `NEXT_PUBLIC_SUITEDASH_PORTAL_URL`
- **Value**: `https://clients.friersoncfo.com`
- Click **"Add"**

**Variable 2:**
- **Key**: `NEXT_PUBLIC_ULTIMATETAX_URL`
- **Value**: Your actual UltimateTax URL
- Click **"Add"**

**Variable 3** (optional if you have PayPal):
- **Key**: `NEXT_PUBLIC_PAYPAL_CLIENT_ID`
- **Value**: Your PayPal client ID
- Click **"Add"**

### 7.3 Redeploy

After adding variables:
1. Go to **"Deployments"** tab
2. Click the **three dots** (...) on the latest deployment
3. Click **"Redeploy"**
4. Wait 2 minutes for redeployment

---

## 🌐 Step 8: Add Your Custom Domain (Optional)

### 8.1 Add Domain in Vercel

1. In your Vercel project, go to **"Settings"** → **"Domains"**
2. Click **"Add"**
3. Enter your domain (e.g., `libertytax.com` or `clients.friersoncfo.com`)
4. Click **"Add"**

### 8.2 Configure DNS

Vercel will show you DNS records to add. 

**If you own the domain:**
1. Log into your domain registrar (GoDaddy, Namecheap, etc.)
2. Find DNS settings
3. Add the records Vercel provides:

**For root domain (libertytax.com):**
```
Type: A
Name: @
Value: 76.76.21.21
```

**For subdomain (clients.friersoncfo.com):**
```
Type: CNAME
Name: clients
Value: cname.vercel-dns.com
```

### 8.3 Wait for DNS

- DNS propagation: 5 minutes to 48 hours
- Vercel auto-provisions SSL certificate
- Green checkmark appears when ready

---

## 🔄 Step 9: Making Updates in the Future

### 9.1 Edit Files in Codespace

1. Go to your GitHub repository
2. Click **"Code"** → **"Codespaces"**
3. Click on your existing Codespace (or create new one)
4. Edit files in the editor
5. Save changes (Ctrl+S or Cmd+S)

### 9.2 Commit Changes to GitHub

In the Codespace terminal:

```bash
# Stage all changes
git add .

# Commit with message
git commit -m "Updated pricing page"

# Push to GitHub
git push
```

### 9.3 Deploy Updates

**Option A: Automatic** (if you set up Git integration in Vercel)
- Push to GitHub automatically triggers deployment
- Wait 2-3 minutes
- Changes are live

**Option B: Manual** (using Vercel CLI in Codespace)

```bash
vercel --prod
```

---

## 🔧 Troubleshooting

### Codespace Won't Start

**Solution**:
1. Refresh browser page
2. Wait 5 minutes and try again
3. Delete codespace and create new one:
   - Repository → Code → Codespaces → three dots → Delete
   - Create new codespace

### "Command not found: npm"

**Solution**: Codespace is still setting up. Wait 2-3 minutes and try again.

### Build Errors

**Solution**:
1. Copy the error message
2. Check if files uploaded correctly to GitHub
3. Verify all files from zip are present
4. Run `npm install` again

### Deployment Fails

**Solution**:
1. Check Vercel dashboard for error logs
2. Verify `npm run build` works in Codespace
3. Check environment variables are set
4. Try deploying again: `vercel --prod`

### Site Loads But Looks Broken

**Solution**:
1. Hard refresh: Ctrl+Shift+R (Windows) or Cmd+Shift+R (Mac)
2. Check browser console (F12) for errors
3. Verify environment variables in Vercel
4. Check Vercel deployment logs

### Forms Don't Work

**Solution**:
1. Verify environment variables in Vercel
2. Check API routes exist: `src/app/api/esign/`
3. Test form locally in Codespace first
4. Check browser console for errors

### Can't Find Codespace

**Solution**:
1. Go to repository on GitHub
2. Click "Code" → "Codespaces" tab
3. Your active codespaces are listed
4. Or create a new one

### Codespace Timed Out

**Codespaces auto-stop after 30 minutes of inactivity**

**Solution**:
1. Go to repository → Code → Codespaces
2. Click on your stopped codespace to restart it
3. Continues where you left off

---

## 💡 Tips for Using Codespaces

### Saving Money (Codespaces are Free with Limits)

- **Free tier**: 120 core-hours/month, 15 GB storage
- **Stop Codespace when done**: It auto-stops after 30 minutes
- **Delete old Codespaces**: Keep only what you need
- **Check usage**: Settings → Billing → Codespaces usage

### Keyboard Shortcuts

- **Save file**: Ctrl+S (Windows) or Cmd+S (Mac)
- **Open terminal**: Ctrl+` (backtick)
- **Close terminal**: Click X on terminal tab
- **Search files**: Ctrl+P or Cmd+P

### Best Practices

1. **One Codespace per project** - Don't create multiple
2. **Commit changes often** - Use `git commit` regularly
3. **Stop when done** - Saves free hours
4. **Keep browser tab open** - Don't close during operations

---

## ✅ Final Checklist

After completing all steps:

- [ ] GitHub repository created with all files
- [ ] Codespace created and working
- [ ] `npm install` completed successfully
- [ ] `npm run build` works without errors
- [ ] `.env.local` created and configured
- [ ] Vercel CLI installed and logged in
- [ ] Site deployed to Vercel
- [ ] Production URL loads correctly
- [ ] Environment variables added in Vercel
- [ ] Site redeployed with env vars
- [ ] All pages tested and working
- [ ] Forms generate PDFs correctly
- [ ] Custom domain added (if applicable)
- [ ] DNS configured and SSL active

---

## 📞 Next Steps

After successful deployment:

1. **Bookmark your Codespace** for easy access
2. **Bookmark Vercel dashboard** to monitor site
3. **Test thoroughly** - go through every page
4. **Update content** as needed
5. **Share your live URL** with clients

---

## 🎯 Quick Command Reference

```bash
# Install dependencies
npm install

# Test build
npm run build

# Deploy to Vercel
vercel --prod

# Commit changes
git add .
git commit -m "Your message"
git push

# Check what changed
git status

# View environment file
cat .env.local
```

---

## 🆘 Need Help?

If you get stuck:

1. **Check error messages** carefully
2. **Try the Troubleshooting section** above
3. **GitHub Codespaces docs**: https://docs.github.com/codespaces
4. **Vercel docs**: https://vercel.com/docs
5. **Take a screenshot** of errors for debugging

---

**Congratulations!** You've deployed your website without installing anything on your computer. Everything runs in the cloud via GitHub Codespaces and Vercel.

Your website is now live and accessible to anyone with the URL!

---

**Created**: December 26, 2025  
**Method**: GitHub Codespaces (Browser-Only Deployment)  
**No Local Installation Required** ✅
