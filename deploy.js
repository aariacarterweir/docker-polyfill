const { execSync } = require('child_process');

const yarnBin = execSync('yarn bin').toString().replace('\n', '');

const commands = [
    'git pull origin master',
    'yarn --non-interactive',
    'yarn pull',
    'yarn up -d',
];

execSync(commands.join(' && '), {
    stdio: 'inherit',
    env: {
        ...process.env,
        PATH: `${yarnBin}:${process.env.PATH}`,
    },
});
