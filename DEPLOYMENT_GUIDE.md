# Liberty Strategic Tax Advisory - Complete Deployment Guide

## 📋 Prerequisites

Before you begin, ensure you have:

1. **Node.js 18+** or **20+** installed ([Download](https://nodejs.org/))
2. **Git** installed ([Download](https://git-scm.com/))
3. A **GitHub account** ([Sign up](https://github.com/))
4. A **Vercel account** ([Sign up](https://vercel.com/)) - Use "Continue with GitHub" for seamless integration
5. Your **domain registrar** login credentials (if using a custom domain)

---

## 🚀 Step 1: Set Up Local Development

### 1.1 Navigate to Your Project Directory

```bash
cd /path/to/liberty-strategic-tax-advisory-site-updated-about
```

### 1.2 Install Dependencies

```bash
npm install
```

This installs all required packages including Next.js, React, Tailwind CSS, pdf-lib, and Vercel Analytics.

### 1.3 Configure Environment Variables

Create your local environment file:

```bash
cp .env.example .env.local
```

Edit `.env.local` with your actual values:

```env
# Public (safe in browser) configuration
NEXT_PUBLIC_SUITEDASH_PORTAL_URL=https://clients.friersoncfo.com
NEXT_PUBLIC_ULTIMATETAX_URL=https://YOUR-ULTIMATETAX-URL
NEXT_PUBLIC_PAYPAL_CLIENT_ID=YOUR_PAYPAL_CLIENT_ID
```

**Environment Variable Details:**
- `NEXT_PUBLIC_SUITEDASH_PORTAL_URL`: Your SuiteDash client portal URL (already set to your portal)
- `NEXT_PUBLIC_ULTIMATETAX_URL`: Your UltimateTax portal URL (update this)
- `NEXT_PUBLIC_PAYPAL_CLIENT_ID`: Your PayPal client ID for payment buttons (optional - buttons won't render without this)

### 1.4 Test Locally

Start the development server:

```bash
npm run dev
```

Open your browser to `http://localhost:3000` and verify:
- ✅ Homepage loads correctly
- ✅ Navigation works (Services, Pricing, About, etc.)
- ✅ Forms pages load
- ✅ Styling appears correct

Press `Ctrl+C` to stop the server when done testing.

---

## 📦 Step 2: Create GitHub Repository

### 2.1 Create a New Repository on GitHub

1. Go to [GitHub](https://github.com/) and sign in
2. Click the **"+"** icon in the top-right → **"New repository"**
3. Repository settings:
   - **Repository name**: `liberty-strategic-tax-advisory` (or your preferred name)
   - **Description**: "Liberty Strategic Tax Advisory - Professional tax services website"
   - **Visibility**: Private (recommended) or Public
   - **DO NOT** check "Initialize this repository with a README" (you already have one)
4. Click **"Create repository"**

### 2.2 Initialize Git and Push Your Code

In your project directory, run these commands:

```bash
# Initialize Git repository
git init

# Add all files to staging
git add -A

# Create your first commit
git commit -m "Initial commit: Liberty Strategic Tax Advisory site"

# Rename default branch to main
git branch -M main

# Add your GitHub repository as remote origin
# Replace YOUR_USERNAME with your GitHub username
git remote add origin https://github.com/YOUR_USERNAME/liberty-strategic-tax-advisory.git

# Push to GitHub
git push -u origin main
```

**If you encounter authentication issues:**
- GitHub now requires a Personal Access Token (PAT) instead of password
- Go to GitHub → Settings → Developer Settings → Personal Access Tokens → Tokens (classic)
- Generate new token with `repo` scope
- Use this token as your password when prompted

### 2.3 Verify Upload

Go to your GitHub repository URL and confirm all files are visible, including:
- `src/` directory
- `public/` directory
- `package.json`
- `README.md`
- Configuration files

---

## ☁️ Step 3: Deploy to Vercel

### Option A: Import from GitHub (Recommended)

This is the easiest method and enables automatic deployments when you push to GitHub.

#### 3.1 Connect GitHub to Vercel

1. Go to [Vercel](https://vercel.com/)
2. Sign in with GitHub (or click "Continue with GitHub" if first time)
3. Authorize Vercel to access your GitHub repositories

#### 3.2 Import Your Repository

1. Click **"Add New..."** → **"Project"**
2. Find your repository `liberty-strategic-tax-advisory` in the list
3. Click **"Import"**

#### 3.3 Configure Build Settings

Vercel should auto-detect Next.js settings:

- **Framework Preset**: Next.js ✅ (auto-detected)
- **Root Directory**: `./` (leave as default)
- **Build Command**: `npm run build` (auto-filled)
- **Output Directory**: `.next` (auto-filled)
- **Install Command**: `npm install` (auto-filled)

#### 3.4 Add Environment Variables

Click **"Environment Variables"** and add:

| Name | Value | Notes |
|------|-------|-------|
| `NEXT_PUBLIC_SUITEDASH_PORTAL_URL` | `https://clients.friersoncfo.com` | Your SuiteDash portal |
| `NEXT_PUBLIC_ULTIMATETAX_URL` | Your UltimateTax URL | Update with actual URL |
| `NEXT_PUBLIC_PAYPAL_CLIENT_ID` | Your PayPal Client ID | Optional - for payment buttons |

**Important:** Make sure to select "Production" for the environment (default).

#### 3.5 Deploy

1. Click **"Deploy"**
2. Wait 2-3 minutes for the build to complete
3. You'll see a success screen with your deployed URL (something like `liberty-strategic-tax-advisory-xyz.vercel.app`)

#### 3.6 Test Your Deployment

Click the provided URL and verify:
- ✅ All pages load correctly
- ✅ Links work properly
- ✅ Forms render correctly
- ✅ SuiteDash portal link works
- ✅ Styling is correct

### Option B: Deploy via Vercel CLI

If you prefer command-line deployment:

```bash
# Install Vercel CLI globally
npm install -g vercel

# Login to Vercel
vercel login

# Deploy (follow prompts)
vercel

# For production deployment
vercel --prod
```

---

## 🌐 Step 4: Connect Your Custom Domain

### 4.1 Add Domain in Vercel

1. In your Vercel project, go to **Settings** → **Domains**
2. Click **"Add"**
3. Enter your domain name (e.g., `libertytax.com` or `clients.friersoncfo.com`)
4. Click **"Add"**

### 4.2 Configure DNS

Vercel will show you DNS records to add. Two common scenarios:

**Scenario A: Root Domain (libertytax.com)**
Add these DNS records at your domain registrar:
```
Type: A
Name: @
Value: 76.76.21.21
```

**Scenario B: Subdomain (clients.friersoncfo.com)**
Add this DNS record:
```
Type: CNAME
Name: clients
Value: cname.vercel-dns.com
```

### 4.3 DNS Propagation

- DNS changes can take 5 minutes to 48 hours to propagate
- Vercel will automatically provision SSL certificates once DNS is configured
- You'll see a green checkmark when the domain is active

---

## 🔄 Step 5: Automatic Deployments

With GitHub integration, every time you push to the `main` branch, Vercel automatically:

1. Detects the push
2. Runs `npm run build`
3. Deploys the new version
4. Updates your production site

### Making Updates

```bash
# Make your code changes
# Then:

git add .
git commit -m "Description of changes"
git push origin main

# Vercel automatically deploys in ~2 minutes
```

### Preview Deployments

- Every pull request gets its own preview URL
- Test changes before merging to production
- Great for reviewing updates with your team

---

## 🛠️ Step 6: Post-Deployment Configuration

### 6.1 Update Environment Variables

If you need to update environment variables after deployment:

1. Go to Vercel project → **Settings** → **Environment Variables**
2. Click the variable you want to update
3. Click **Edit** → Update the value → **Save**
4. **Important:** Redeploy for changes to take effect:
   - Go to **Deployments**
   - Click the three dots on latest deployment → **Redeploy**

### 6.2 Configure Analytics (Optional)

Your site already includes Vercel Analytics. To view:

1. Go to your Vercel project
2. Click **Analytics** tab
3. View page views, visitors, and performance metrics

### 6.3 Set Up Custom 404 Page (Optional)

Currently using Next.js default. To customize:

1. Create `src/app/not-found.tsx`
2. Style it to match your brand
3. Deploy

---

## 📝 Project Structure Reference

```
liberty-strategic-tax-advisory/
├── src/
│   ├── app/                    # Next.js App Router pages
│   │   ├── page.tsx           # Homepage
│   │   ├── about/             # About page
│   │   ├── services/          # Services page
│   │   ├── pricing/           # Pricing page
│   │   ├── checklist/         # Tax checklist
│   │   ├── forms/             # E-signature forms
│   │   │   ├── engagement/    # Engagement letter
│   │   │   └── 8879/          # IRS Form 8879
│   │   ├── client-portal/     # Portal redirect
│   │   └── api/               # API routes
│   │       └── esign/         # PDF generation endpoints
│   ├── components/            # Reusable React components
│   ├── data/                  # Form configurations
│   └── styles/                # Global CSS
├── public/                    # Static assets (logo, etc.)
├── package.json              # Dependencies
├── next.config.mjs          # Next.js configuration
├── tailwind.config.ts       # Tailwind CSS configuration
└── .env.local               # Local environment variables (not committed)
```

---

## 🔧 Common Commands

```bash
# Development
npm run dev          # Start development server (localhost:3000)
npm run build        # Create production build
npm run start        # Start production server locally
npm run lint         # Run ESLint

# Git
git status          # Check what files changed
git add .           # Stage all changes
git commit -m "msg" # Commit changes
git push            # Push to GitHub (triggers Vercel deploy)

# Vercel CLI
vercel              # Deploy to preview
vercel --prod       # Deploy to production
vercel logs         # View deployment logs
vercel env ls       # List environment variables
```

---

## 🐛 Troubleshooting

### Build Fails on Vercel

1. Check the build logs in Vercel dashboard
2. Common issues:
   - Missing environment variables → Add them in Vercel settings
   - TypeScript errors → Run `npm run build` locally first
   - Missing dependencies → Ensure `package.json` is up to date

### Domain Not Working

1. Verify DNS records are correct (use `dig` or `nslookup`)
2. Wait for DNS propagation (can take up to 48 hours)
3. Check Vercel dashboard for SSL certificate status

### Forms Not Working

1. Verify API routes are deployed (check `/api/esign/engagement`)
2. Check browser console for errors
3. Verify PDF generation logic in `src/app/api/esign/*/route.ts`

### PayPal Buttons Not Showing

1. Verify `NEXT_PUBLIC_PAYPAL_CLIENT_ID` is set in Vercel
2. Check browser console for PayPal SDK errors
3. Ensure your PayPal client ID is valid

---

## 📧 Support Resources

- **Next.js Documentation**: https://nextjs.org/docs
- **Vercel Documentation**: https://vercel.com/docs
- **GitHub Documentation**: https://docs.github.com/
- **Tailwind CSS**: https://tailwindcss.com/docs

---

## ✅ Deployment Checklist

- [ ] Node.js 18+ installed
- [ ] Project dependencies installed (`npm install`)
- [ ] Local development tested (`npm run dev`)
- [ ] Environment variables configured in `.env.local`
- [ ] GitHub repository created
- [ ] Code pushed to GitHub
- [ ] Vercel account created (with GitHub integration)
- [ ] Project imported to Vercel
- [ ] Environment variables added in Vercel
- [ ] Initial deployment successful
- [ ] Production URL tested
- [ ] Custom domain added (if applicable)
- [ ] DNS records configured
- [ ] SSL certificate active
- [ ] All pages and features verified
- [ ] Client portal link working
- [ ] Forms generating PDFs correctly

---

## 🎯 Next Steps

After deployment:

1. **Test thoroughly**: Go through every page and form
2. **Update content**: Replace placeholder text with your actual content
3. **Add real URLs**: Update `NEXT_PUBLIC_ULTIMATETAX_URL` and PayPal ID
4. **Configure SuiteDash**: Ensure your portal is properly set up
5. **Monitor analytics**: Track visitor behavior through Vercel Analytics
6. **Set up error tracking**: Consider adding Sentry or similar for production error monitoring
7. **Create backups**: Regularly backup your GitHub repository

---

## 📞 Your Contact Information

Liberty Healthcare Financial Strategist & Tax Advisory Services
- Website: [Your deployed URL]
- Email: [Your email]
- Phone: [Your phone]

---

**Last Updated**: December 26, 2025
**Version**: 1.0.0
