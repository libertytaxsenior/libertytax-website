# LibertyTax Website (Next.js + Vercel)

This is a production-ready Next.js (App Router) website for **LibertyTax — Senior Accountants & Strategic CFO Advisor**.
It includes a basic marketing site plus a client e-sign flow that generates PDFs (demo implementation).

## Local development

1. Install Node.js 18+ (or 20+)
2. Install deps:

```bash
npm install
```

3. Create a local env file:

```bash
cp .env.example .env.local
```

4. Run:

```bash
npm run dev
```

Open http://localhost:3000

## Environment variables

- `SUITEDASH_PORTAL_URL` — your SuiteDash portal URL (default: https://clients.friersoncfo.com)

## Deploy to GitHub

```bash
git init
git add -A
git commit -m "Initial LibertyTax site"
git branch -M main
git remote add origin https://github.com/<YOUR_ORG>/<YOUR_REPO>.git
git push -u origin main
```

## Deploy to Vercel

**Option A (recommended): Import GitHub repo**
1. Go to Vercel → **Add New** → **Project**
2. Import the GitHub repo
3. Framework preset: **Next.js**
4. Environment Variables:
   - `SUITEDASH_PORTAL_URL` = `https://clients.friersoncfo.com` (or your portal link)
5. Deploy

**Option B: Vercel CLI**
```bash
npm i -g vercel
vercel login
vercel
```

## Connect your domain

In Vercel:
1. Project → Settings → Domains
2. Add your domain (e.g., `clients.friersoncfo.com` or a marketing domain like `libertytax...`)
3. Follow Vercel's DNS instructions in your domain registrar.

## Notes

- The e-signature PDFs are generated on-demand via API routes in `src/app/api/esign/*`.
- For production storage, connect the generated PDFs to SuiteDash, S3, or another document store.
