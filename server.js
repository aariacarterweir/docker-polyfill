const { execSync } = require('child_process');
const path = require('path');
const dotenv = require('dotenv');

// get action and args
const [, , action, ...args] = process.argv;

// alias execSync for eases of the uses
const ex = (cmd, options = {}) => execSync(cmd, { stdio: 'inherit', ...options });

// load env vars
dotenv.config({ path: path.resolve(__dirname, '../', '.env') });

// boot up
if (action === 'up') {
    ex('yarn docker-nginx-global-proxy up');
    ex(`docker-compose up ${args.join(' ')}`);
}

// down
if (action === 'down') {
    ex(`docker-compose down ${args.join(' ')}`);
}
