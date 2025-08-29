const path = require('path');
const fs = require('fs');
const esbuild = require('esbuild');
const rails = require('esbuild-rails');
const sassPlugin = require('esbuild-plugin-sass');
const { execSync } = require('child_process');

const watch = process.argv.includes('--watch');
const rebuildVueSimulator = process.env.REBUILD_VUE === 'true';

function log(msg) {
  console.log(`[${new Date().toLocaleString()}] ${msg}`);
}

function validatePackageJson() {
  const pkgDir = path.join(process.cwd(), 'cv-frontend-vue');
  if (!fs.existsSync(path.join(pkgDir, 'package.json')) || !fs.existsSync(path.join(pkgDir, 'package-lock.json'))) {
    throw new Error('package.json or package-lock.json missing in cv-frontend-vue');
  }
}

function buildVueSimulator() {
  const vueDir = path.join(process.cwd(), 'cv-frontend-vue');
  execSync('npm install', { cwd: vueDir, stdio: 'inherit' });
  execSync(rebuildVueSimulator ? 'npm run build -- --watch' : 'npm run build', { cwd: vueDir, stdio: 'inherit' });
}

async function buildVue() {
  if (process.env.NODE_ENV !== 'production') {
    try {
      validatePackageJson();
      buildVueSimulator();
    } catch (err) {
      console.error(`Error building Vue simulator:\n${err}`);
      process.exit(1);
    }
  }
}

async function runEsbuild() {
  const context = await esbuild.context({
    entryPoints: ['application.js', 'testbench.js'],
    bundle: true,
    outdir: path.join(process.cwd(), 'app/assets/builds'),
    absWorkingDir: path.join(process.cwd(), 'app/javascript'),
    sourcemap: 'inline',
    loader: {
      '.png': 'file',
      '.svg': 'file',
      '.ttf': 'file',
      '.woff': 'file',
      '.woff2': 'file',
      '.eot': 'file',
    },
    plugins: [
      rails(),
      sassPlugin({
        includePaths: [path.resolve('node_modules')], // ✅ Fix for Bootstrap imports
      }),
      {
        name: 'watchPlugin',
        setup(build) {
          build.onStart(() => log('Build starting...'));
          build.onEnd((result) => log(result.errors.length ? 'Build finished with errors' : 'Build finished successfully'));
        },
      },
    ],
  });

  if (watch) {
    await context.watch();
  } else {
    await context.rebuild();
    context.dispose();
  }
}

buildVue();
runEsbuild().catch(() => process.exit(1));
