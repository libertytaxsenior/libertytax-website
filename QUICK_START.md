# Quick Reference Card

## 🚀 First-Time Setup (5 Minutes)

```bash
# 1. Install dependencies
npm install

# 2. Set up environment
cp .env.example .env.local
# Edit .env.local with your values

# 3. Test locally
npm run dev
# Visit http://localhost:3000

# 4. Push to GitHub
git init
git add -A
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
git push -u origin main

# 5. Deploy to Vercel
# Go to vercel.com → Import GitHub repo → Deploy
```

---

## 🔄 Making Updates

```bash
# 1. Make your changes in code

# 2. Test locally
npm run dev

# 3. Push to GitHub (auto-deploys to Vercel)
git add .
git commit -m "Description of what you changed"
git push
```

---

## 🌐 Environment Variables

Add these in Vercel → Project Settings → Environment Variables:

```env
NEXT_PUBLIC_SUITEDASH_PORTAL_URL=https://clients.friersoncfo.com
NEXT_PUBLIC_ULTIMATETAX_URL=https://YOUR-ULTIMATETAX-URL
NEXT_PUBLIC_PAYPAL_CLIENT_ID=YOUR_PAYPAL_CLIENT_ID
```

After adding/updating environment variables, you must **redeploy** for changes to take effect.

---

## 🛠️ Useful Commands

| Command | Purpose |
|---------|---------|
| `npm run dev` | Start development server |
| `npm run build` | Test production build locally |
| `git status` | See what files changed |
| `git push` | Deploy to production (via Vercel) |
| `vercel logs` | View deployment logs |

---

## 🐛 Common Issues

### "Module not found" error
```bash
rm -rf node_modules package-lock.json
npm install
```

### Build fails on Vercel
1. Check build logs in Vercel dashboard
2. Verify environment variables are set
3. Test build locally: `npm run build`

### Domain not working
1. Check DNS settings in your registrar
2. Wait up to 48 hours for DNS propagation
3. Verify domain is added in Vercel → Settings → Domains

### Changes not showing up
1. Hard refresh browser: `Ctrl + Shift + R` (Windows) or `Cmd + Shift + R` (Mac)
2. Check Vercel dashboard to confirm deployment succeeded
3. Wait 30-60 seconds for CDN cache to clear

---

## 📂 Key Files to Edit

| File | What It Does |
|------|--------------|
| `src/app/page.tsx` | Homepage content |
| `src/app/about/page.tsx` | About page |
| `src/app/services/page.tsx` | Services page |
| `src/app/pricing/page.tsx` | Pricing page |
| `src/components/Nav.tsx` | Navigation menu |
| `src/components/Footer.tsx` | Footer |
| `.env.local` | Local environment variables |

---

## 🔗 Important Links

- **Vercel Dashboard**: https://vercel.com/dashboard
- **GitHub Repo**: https://github.com/YOUR_USERNAME/REPO_NAME
- **Next.js Docs**: https://nextjs.org/docs
- **Vercel Docs**: https://vercel.com/docs

---

## ✅ Pre-Launch Checklist

- [ ] All environment variables set in Vercel
- [ ] Custom domain configured and SSL active
- [ ] All pages tested and working
- [ ] Forms generate PDFs correctly
- [ ] SuiteDash portal link works
- [ ] PayPal buttons configured (if using)
- [ ] Contact information updated
- [ ] Logo uploaded and displaying
- [ ] Mobile responsiveness tested
- [ ] Browser testing (Chrome, Safari, Firefox)

---

**Need Help?** See DEPLOYMENT_GUIDE.md for detailed instructions.
