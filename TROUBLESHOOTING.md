# Troubleshooting Guide

## 🔍 Common Issues and Solutions

### Build Issues

#### "Module not found" or "Cannot find module"

**Problem**: Missing dependencies or corrupted node_modules

**Solution**:
```bash
# Delete node_modules and package-lock.json
rm -rf node_modules package-lock.json

# Reinstall dependencies
npm install

# Test build
npm run build
```

#### TypeScript Errors During Build

**Problem**: Type checking failures

**Solution**:
```bash
# Run TypeScript check locally
npx tsc --noEmit

# Check specific files mentioned in error
# Fix type issues, then rebuild
npm run build
```

#### "Command failed with exit code 1" on Vercel

**Problem**: Build command failed

**Solution**:
1. Check full build logs in Vercel dashboard
2. Look for the actual error (usually near the end)
3. Common causes:
   - Missing environment variables
   - Import errors
   - TypeScript errors
   - Syntax errors
4. Test locally: `npm run build`
5. Fix errors, commit, and push

---

### Deployment Issues

#### Changes Not Appearing on Site

**Problem**: Old version still showing

**Solutions**:

1. **Hard refresh browser**:
   - Windows/Linux: `Ctrl + Shift + R`
   - Mac: `Cmd + Shift + R`

2. **Check deployment status**:
   - Go to Vercel dashboard
   - Verify latest deployment shows "Ready"
   - Check deployment URL matches your domain

3. **Force redeploy**:
   - Vercel dashboard → Deployments
   - Click three dots on latest → "Redeploy"

4. **Clear Vercel cache**:
   ```bash
   # In your project
   git commit --allow-empty -m "Force rebuild"
   git push
   ```

#### Automatic Deployments Not Working

**Problem**: Pushing to GitHub doesn't trigger Vercel deployment

**Solution**:
1. Check Vercel project → Settings → Git
2. Verify GitHub integration is active
3. Check production branch is set to `main`
4. Re-authorize GitHub connection if needed

---

### Domain Issues

#### Domain Shows "404: Not Found"

**Problem**: Domain not properly connected

**Solutions**:

1. **Verify DNS records**:
   ```bash
   # Check DNS (Mac/Linux)
   dig yourdomain.com
   nslookup yourdomain.com
   
   # Should show Vercel's IP: 76.76.21.21
   ```

2. **Check Vercel dashboard**:
   - Settings → Domains
   - Look for green checkmark
   - If red X, click for instructions

3. **Wait for DNS propagation**:
   - Can take 5 minutes to 48 hours
   - Check status: https://www.whatsmydns.net/

#### SSL Certificate Issues

**Problem**: "Your connection is not private" error

**Solutions**:

1. **Wait for SSL provisioning** (usually 5-10 minutes)
2. **Check Vercel dashboard**:
   - Settings → Domains
   - SSL should show "Active"
3. **If stuck**:
   - Remove domain in Vercel
   - Wait 5 minutes
   - Re-add domain

#### Wrong Domain Showing

**Problem**: Vercel's default domain instead of custom domain

**Solutions**:

1. **Set custom domain as primary**:
   - Vercel → Settings → Domains
   - Click domain → "Set as Primary"

2. **Redirect default domain**:
   - Already configured in `vercel.json`
   - Vercel automatically redirects

---

### Environment Variable Issues

#### Environment Variables Not Working

**Problem**: Config values not loading

**Solutions**:

1. **Verify variable names**:
   - Must start with `NEXT_PUBLIC_` for browser access
   - Check spelling/capitalization exactly

2. **Check Vercel settings**:
   - Settings → Environment Variables
   - Ensure variables are set for "Production"
   - Click "Redeploy" after adding/changing

3. **Test locally**:
   ```bash
   # Check .env.local exists
   ls -la .env.local
   
   # Verify values
   cat .env.local
   
   # Restart dev server
   npm run dev
   ```

#### Different Values in Dev vs Production

**Problem**: Works locally, fails on Vercel

**Solution**:
1. Local uses `.env.local`
2. Production uses Vercel environment variables
3. Ensure both have same values
4. Redeploy after updating Vercel variables

---

### Git Issues

#### Authentication Failed

**Problem**: Cannot push to GitHub

**Solutions**:

1. **Use Personal Access Token**:
   - GitHub → Settings → Developer Settings
   - Personal Access Tokens → Tokens (classic)
   - Generate new token with `repo` scope
   - Use token as password when prompted

2. **Update remote URL** (if using token):
   ```bash
   git remote set-url origin https://YOUR_TOKEN@github.com/USERNAME/REPO.git
   ```

3. **Or use SSH** (recommended):
   ```bash
   # Generate SSH key
   ssh-keygen -t ed25519 -C "your_email@example.com"
   
   # Add to GitHub
   cat ~/.ssh/id_ed25519.pub
   # Copy output to GitHub → Settings → SSH Keys
   
   # Update remote
   git remote set-url origin git@github.com:USERNAME/REPO.git
   ```

#### "Repository not found" Error

**Problem**: Remote repository doesn't exist

**Solution**:
1. Create repository on GitHub first
2. Verify repository name matches exactly
3. Check you have access to the repository

#### Merge Conflicts

**Problem**: Cannot push due to conflicts

**Solution**:
```bash
# Pull latest changes
git pull origin main

# Fix conflicts in editor (look for <<<<<<, ======, >>>>>>)
# Edit files to keep desired changes

# Stage resolved files
git add .

# Complete merge
git commit -m "Resolve merge conflicts"

# Push
git push
```

---

### Performance Issues

#### Slow Page Loads

**Solutions**:

1. **Enable Vercel Analytics** (already included):
   - Check Vercel dashboard → Analytics
   - Identify slow pages

2. **Optimize images**:
   - Use Next.js Image component
   - Compress images before uploading

3. **Check bundle size**:
   ```bash
   npm run build
   # Look for warnings about large bundles
   ```

#### API Routes Timing Out

**Problem**: PDF generation or form submission fails

**Solutions**:

1. **Check Vercel function logs**:
   - Dashboard → Functions → Select function
   - Look for errors or timeouts

2. **Test API locally**:
   ```bash
   npm run build
   npm start
   # Test form submissions
   ```

3. **Increase timeout** (Vercel config):
   - Free tier: 10s limit
   - Pro tier: 60s limit
   - Consider upgrading if needed

---

### Form/PDF Issues

#### PDFs Not Generating

**Problem**: Form submission fails

**Solutions**:

1. **Check API route logs** in Vercel
2. **Test locally**:
   ```bash
   npm run dev
   # Try form submission
   # Check browser console for errors
   ```

3. **Verify pdf-lib is installed**:
   ```bash
   npm list pdf-lib
   # Should show version 1.17.1
   ```

4. **Check form data**:
   - Open browser DevTools → Network
   - Submit form
   - Check request payload and response

#### Forms Not Submitting

**Problem**: Button click does nothing

**Solutions**:

1. **Check browser console** (F12):
   - Look for JavaScript errors
   - Check network tab for failed requests

2. **Verify API routes exist**:
   - `src/app/api/esign/engagement/route.ts`
   - `src/app/api/esign/8879/route.ts`

3. **Test form validation**:
   - Fill all required fields
   - Check for validation errors

---

### PayPal Issues

#### PayPal Buttons Not Showing

**Problem**: Payment buttons missing

**Solutions**:

1. **Verify environment variable**:
   ```bash
   # Check Vercel settings
   NEXT_PUBLIC_PAYPAL_CLIENT_ID=YOUR_CLIENT_ID
   ```

2. **Check PayPal SDK loading**:
   - Browser console → Network
   - Look for paypal.com script
   - Check for load errors

3. **Verify Client ID is valid**:
   - Log into PayPal Developer Dashboard
   - Check App credentials match

---

## 🆘 Getting Help

### Before Asking for Help

1. **Check error messages carefully**:
   - Copy exact error text
   - Note where error occurs (build, runtime, browser)

2. **Check these locations**:
   - Vercel build logs (full)
   - Browser console (F12)
   - Network tab (F12)
   - Vercel function logs

3. **Try the basics**:
   - Clear cache and hard refresh
   - Redeploy in Vercel
   - Test locally with `npm run build`

### Where to Get Help

1. **Vercel Support**:
   - https://vercel.com/support
   - Live chat for Pro users

2. **Next.js Discussions**:
   - https://github.com/vercel/next.js/discussions

3. **Stack Overflow**:
   - Tag questions with: `next.js`, `vercel`, `react`

### Information to Include

When reporting issues:
- **Exact error message** (full text)
- **Steps to reproduce**
- **What you've tried**
- **Vercel deployment URL** (if safe to share)
- **Build logs** (relevant sections)
- **Browser and version**

---

## 🔧 Diagnostic Commands

```bash
# Check Node version (should be 18+ or 20+)
node --version

# Check npm version
npm --version

# List installed packages
npm list --depth=0

# Check for outdated packages
npm outdated

# Verify project structure
ls -R src/

# Check git status
git status

# View recent commits
git log --oneline -5

# Check remote URL
git remote -v

# Test build locally
npm run build

# Check for TypeScript errors
npx tsc --noEmit

# View environment variables (local)
cat .env.local
```

---

## 📊 Health Check Checklist

Run through this checklist to verify everything is working:

- [ ] `npm run dev` starts without errors
- [ ] `npm run build` completes successfully
- [ ] All pages load in development (localhost:3000)
- [ ] Forms render correctly
- [ ] PDF generation works (test form submissions)
- [ ] Git repository is up to date (`git status` clean)
- [ ] Latest code is on GitHub
- [ ] Vercel deployment shows "Ready"
- [ ] Production URL loads correctly
- [ ] All navigation links work
- [ ] SuiteDash portal link redirects properly
- [ ] Custom domain shows SSL active
- [ ] Environment variables set in Vercel
- [ ] No console errors in browser (F12)

---

**Last Updated**: December 26, 2025
