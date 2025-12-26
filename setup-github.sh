#!/bin/bash

# GitHub Setup Script for Liberty Strategic Tax Advisory
# This script helps you initialize and push your project to GitHub

echo "======================================"
echo "GitHub Repository Setup"
echo "======================================"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first:"
    echo "   macOS: brew install git"
    echo "   Windows: Download from https://git-scm.com/"
    echo "   Linux: sudo apt-get install git"
    exit 1
fi

echo "✅ Git is installed"
echo ""

# Check if already initialized
if [ -d .git ]; then
    echo "⚠️  Git repository already initialized"
    read -p "Do you want to continue anyway? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    # Initialize git
    echo "🔧 Initializing Git repository..."
    git init
    echo "✅ Git repository initialized"
    echo ""
fi

# Get GitHub username
read -p "Enter your GitHub username: " github_username
if [ -z "$github_username" ]; then
    echo "❌ GitHub username cannot be empty"
    exit 1
fi

# Get repository name
read -p "Enter repository name (default: liberty-strategic-tax-advisory): " repo_name
repo_name=${repo_name:-liberty-strategic-tax-advisory}

echo ""
echo "======================================"
echo "Repository Information"
echo "======================================"
echo "GitHub Username: $github_username"
echo "Repository Name: $repo_name"
echo "Repository URL: https://github.com/$github_username/$repo_name.git"
echo ""

read -p "Is this correct? (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Setup cancelled"
    exit 1
fi

# Add files
echo ""
echo "📦 Adding files to Git..."
git add -A
echo "✅ Files added"

# Create initial commit
echo ""
echo "💾 Creating initial commit..."
git commit -m "Initial commit: Liberty Strategic Tax Advisory site"
echo "✅ Commit created"

# Rename branch to main
echo ""
echo "🌿 Setting default branch to 'main'..."
git branch -M main
echo "✅ Branch renamed"

# Add remote
echo ""
echo "🔗 Adding GitHub remote..."
git remote remove origin 2>/dev/null  # Remove if exists
git remote add origin "https://github.com/$github_username/$repo_name.git"
echo "✅ Remote added"

# Push to GitHub
echo ""
echo "======================================"
echo "Ready to Push to GitHub"
echo "======================================"
echo ""
echo "⚠️  IMPORTANT: Before pushing, make sure you have:"
echo "   1. Created the repository on GitHub.com"
echo "   2. Have your GitHub credentials ready (username + personal access token)"
echo ""
echo "To create the repository:"
echo "   1. Go to https://github.com/new"
echo "   2. Repository name: $repo_name"
echo "   3. Keep it Private (recommended)"
echo "   4. DO NOT initialize with README, .gitignore, or license"
echo "   5. Click 'Create repository'"
echo ""

read -p "Have you created the repository on GitHub? (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    echo "Please create the repository first, then run:"
    echo "   git push -u origin main"
    exit 0
fi

echo ""
echo "🚀 Pushing to GitHub..."
echo ""
echo "If prompted for credentials:"
echo "   Username: $github_username"
echo "   Password: Use your Personal Access Token (NOT your password)"
echo ""
echo "Don't have a token? Create one at:"
echo "   https://github.com/settings/tokens"
echo "   Required scopes: 'repo'"
echo ""

git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "======================================"
    echo "✅ SUCCESS!"
    echo "======================================"
    echo ""
    echo "Your code is now on GitHub:"
    echo "   https://github.com/$github_username/$repo_name"
    echo ""
    echo "Next steps:"
    echo "   1. Go to https://vercel.com/"
    echo "   2. Click 'Add New Project'"
    echo "   3. Import your GitHub repository"
    echo "   4. Add environment variables"
    echo "   5. Deploy!"
    echo ""
    echo "See DEPLOYMENT_GUIDE.md for detailed instructions."
else
    echo ""
    echo "======================================"
    echo "❌ Push Failed"
    echo "======================================"
    echo ""
    echo "Common issues:"
    echo "   1. Repository doesn't exist on GitHub - create it first"
    echo "   2. Authentication failed - check your credentials/token"
    echo "   3. Permission denied - verify repository access"
    echo ""
    echo "Try pushing manually:"
    echo "   git push -u origin main"
fi
