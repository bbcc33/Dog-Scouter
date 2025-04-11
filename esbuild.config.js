require('esbuild').build({
  entryPoints: ['app/javascript/application.js'],
  bundle: true,
  outdir: 'app/assets/builds',
  plugins: [
    {
      name: 'rails-ujs',
      setup(build) {
        build.onResolve({ filter: /^@rails\/ujs/ }, args => ({
          path: require.resolve('@rails/ujs')
        }));
      }
    }
  ]
}).catch(() => process.exit(1));
