# GitHub Secrets for Shopify Multi-Store Deployment

## What are GitHub Secrets?
Encrypted environment variables that store sensitive credentials (like Shopify Private App tokens) for GitHub Actions workflows.

## Why Do You Need Them?
- **Local Development**: Uses interactive login (`shopify auth login`) - no secrets needed
- **GitHub Actions**: Runs on GitHub's servers - needs explicit credentials for automation

## Required Secrets for This Project
```
TEST_STORE_1_TOKEN - test-university-1-store Private App token
TEST_STORE_2_TOKEN - test-university-2-store Private App token  
TEST_STORE_3_TOKEN - test-university-3-store Private App token
```

## How to Add Secrets
1. Go to your GitHub repository
2. **Settings** → **Secrets and variables** → **Actions**
3. **New repository secret**
4. Add each token:
   - Name: `TEST_STORE_1_TOKEN`
   - Value: `shpat_xxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

## Alternative: Manual Deployment
Skip secrets and deploy manually:
```bash
shopify theme push --store=test-university-2-store
shopify theme push --store=test-university-3-store
```

## When You Need Secrets
- ✅ Automated multi-store deployments
- ✅ Scaling to 1,100+ stores
- ✅ One-click deployments from Shopify app

## When You Don't Need Secrets
- ❌ Local development with `shopify theme dev`
- ❌ Manual deployments from terminal
- ❌ Single store projects 