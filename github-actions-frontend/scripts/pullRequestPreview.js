import { execSync } from 'child_process';

console.log('[DEPLOY_PREVIEW]: Start');

const command = "yarn deploy:staging"
const output = execSync(command, { encoding: 'utf8' });

console.log('[DEPLOY_PREVIEW]: End');


