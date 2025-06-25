const yaml = require('js-yaml');
const fs = require('fs');

// Read configuration files
const config = yaml.load(fs.readFileSync('config/stores.yml', 'utf8'));
const groups = yaml.load(fs.readFileSync('config/groups.yml', 'utf8'));

// Get target group from command line argument
const targetGroup = process.argv[2] || 'target-stores';

console.log(`🎯 Processing target group: ${targetGroup}`);

// Get stores for the target group
let targetStores = [];
if (groups.groups[targetGroup]) {
  targetStores = groups.groups[targetGroup];
} else {
  console.error(`❌ Group not found: ${targetGroup}`);
  process.exit(1);
}

// Filter to only target stores (exclude global store)
const validStores = targetStores.filter(storeName => {
  const store = config.stores[storeName];
  return store && store.type === 'target';
});

console.log(`📋 Target stores found: ${validStores.join(', ')}`);
console.log(`📊 Total target stores: ${validStores.length}`);

if (validStores.length === 0) {
  console.error(`❌ No valid target stores found for group: ${targetGroup}`);
  process.exit(1);
}

// Create store matrix for GitHub Actions
const storeMatrix = validStores.map(storeName => ({
  name: storeName,
  config: config.stores[storeName]
}));

// Write to GitHub Actions output file
const outputFile = process.env.GITHUB_OUTPUT;
if (outputFile) {
  fs.appendFileSync(outputFile, `stores=${JSON.stringify(storeMatrix)}\n`);
  fs.appendFileSync(outputFile, `total_stores=${validStores.length}\n`);
  console.log(`✅ GitHub Actions output written to ${outputFile}`);
} else {
  console.log('⚠️ GITHUB_OUTPUT not set, running in local mode');
  console.log('Stores:', JSON.stringify(storeMatrix, null, 2));
  console.log('Total stores:', validStores.length);
} 