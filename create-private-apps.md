# Creating Private Apps for Shopify Stores

## ❌ CLI Limitation
**Shopify Private Apps CANNOT be created via CLI** - they must be created through the Shopify Admin interface.

## ✅ Fastest Manual Process

### For Each Store (3 stores total):

#### Store 1: test-university-1-store.myshopify.com
1. **Open**: https://test-university-1-store.myshopify.com/admin/settings/apps
2. **Click**: "Develop apps for your store" 
3. **Click**: "Create an app"
4. **App Name**: `Theme Management`
5. **Configure Admin API Access**:
   - Click "Configure Admin API scopes"
   - Enable: `read_themes` ✅
   - Enable: `write_themes` ✅
   - Click "Save"
6. **Install App**: Click "Install app"
7. **Copy Token**: Copy the "Admin API access token" (starts with `shpat_`)

#### Store 2: test-university-2-store.myshopify.com
Repeat steps 1-7 above

#### Store 3: test-university-3-store.myshopify.com
Repeat steps 1-7 above

---

## 🚀 Quick Setup Commands (After Getting Tokens)

```bash
# Set GitHub Secrets (replace with your actual tokens)
gh secret set TEST_STORE_1_TOKEN --body "shpat_your_token_1_here"
gh secret set TEST_STORE_2_TOKEN --body "shpat_your_token_2_here"
gh secret set TEST_STORE_3_TOKEN --body "shpat_your_token_3_here"

# Test connections
shopify theme list --store=test-university-1-store.myshopify.com --password="shpat_your_token_1_here"
shopify theme list --store=test-university-2-store.myshopify.com --password="shpat_your_token_2_here"
shopify theme list --store=test-university-3-store.myshopify.com --password="shpat_your_token_3_here"
```

---

## 🎯 Why Private Apps for GitHub Actions?

Private Apps are the **best choice** for GitHub Actions because:
- ✅ **Fine-grained permissions** - Only grant what you need
- ✅ **Better security** - API tokens vs simple passwords  
- ✅ **Production ready** - Scales to 1,100+ stores
- ✅ **Audit trail** - Better logging and monitoring
- ✅ **GitHub Actions optimized** - Works seamlessly with CI/CD

---

## 📋 Checklist

- [ ] Create Private App for test-university-1-store
- [ ] Create Private App for test-university-2-store  
- [ ] Create Private App for test-university-3-store
- [ ] Copy all 3 tokens
- [ ] Set GitHub Secrets
- [ ] Test connections with `shopify theme list`

---

## ⏱️ Time Estimate
- **Private Apps**: ~3 minutes per store = **9 minutes total**
- **Perfect for GitHub Actions** and production-ready scaling

## 🔐 Additional Permissions for GitHub Actions

When creating your Private Apps, consider adding these permissions for enhanced functionality:

**Required:**
- ✅ `read_themes` - List and read theme files
- ✅ `write_themes` - Upload and modify themes

**Optional (for advanced features):**
- ✅ `read_products` - Access product data for theme customization
- ✅ `read_script_tags` - Manage tracking scripts
- ✅ `write_script_tags` - Add analytics/tracking
- ✅ `read_content` - Access store content (pages, blogs) 