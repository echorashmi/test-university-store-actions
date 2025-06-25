#!/bin/bash

# Shopify Test Store Setup Script
# Run this after creating development stores via Partners Dashboard

echo "🏪 Shopify Multi-Store Theme Management Setup"
echo "============================================="

# Array of test store URLs (update these with your actual store URLs)
STORES=(
    "test-university-1-store.myshopify.com"
    "test-university-2-store.myshopify.com" 
    "test-university-3-store.myshopify.com"
)

echo "📋 Test Stores to Configure:"
for store in "${STORES[@]}"; do
    echo "  - $store"
done

echo ""
echo "🔧 Next Steps (Manual):"
echo "1. For each store above, create a Private App:"
echo "   - Go to https://{store-name}/admin/settings/apps"
echo "   - Click 'Develop apps for your store'"
echo "   - Click 'Create an app'"
echo "   - App name: 'Theme Management'"
echo "   - Configure Admin API scopes:"
echo "     ✅ read_themes"
echo "     ✅ write_themes"
echo "     ✅ read_products (optional)"
echo "   - Install app and copy the Admin API access token"

echo ""
echo "2. Add tokens to GitHub Secrets:"
for i in "${!STORES[@]}"; do
    store_num=$((i + 1))
    echo "   gh secret set TEST_STORE_${store_num}_TOKEN --body \"shpat_your_token_here\""
done

echo ""
echo "3. Update config/stores.yml with your store details"

echo ""
echo "🚀 Quick Test Commands:"
echo "# Test connection to first store"
echo "shopify theme list --store=test-university-1.myshopify.com"
echo ""
echo "# Initialize a test theme"
echo "shopify theme init --clone-url=https://github.com/Shopify/dawn.git"
echo ""
echo "# Push theme to test store"
echo "shopify theme push --store=test-university-1.myshopify.com --theme=123456789"

echo ""
echo "📖 For detailed setup, see: SHOPIFY_THEME_MANAGEMENT_ARCHITECTURE.md" 