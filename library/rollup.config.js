const resolve = require('rollup-plugin-node-resolve')
const commonjs = require('rollup-plugin-commonjs')
const sourceMaps = require('rollup-plugin-sourcemaps')
const typescript = require('rollup-plugin-typescript2')
const json = require('rollup-plugin-json')
const camelCase = require('lodash.camelcase')

const requiredFieldSuggestions = {
  main: 'dist/index.cjs.js',
  module: 'dist/index.es.js',
  browser: 'dist/index.umd.js',
}

module.exports = function (pkg) {
  const external = Object.keys(Object.assign(
    {},
    pkg.dependencies,
    pkg.peerDependencies,
    pkg.devDependencies,
  ))
  Object.keys(requiredFieldSuggestions).forEach((field) => {
    if (!pkg[field]) {
      throw new Error(`Missing package.json ${field} field. Consider using ${requiredFieldSuggestions[field]}`)
    }
  })
  const entry = 'src/index.ts'
  return {
    input: entry,
    output: [
      { file: pkg.main, format: 'cjs', sourcemap: true },
      { file: pkg.module, format: 'es', sourcemap: true },
      { file: pkg.browser, format: 'umd', sourcemap: true, name: camelCase(pkg.name) },
    ],
    // Indicate here external modules you don't wanna include in your bundle (i.e.: 'lodash')
    external,
    watch: {
      include: 'src/**',
    },
    plugins: [
      // Allow json resolution
      json(),
      // Compile TypeScript files
      typescript({
        useTsconfigDeclarationDir: true,
        tsconfig: './tsconfig.build.json',
      }),
      // Allow bundling cjs modules (unlike webpack, rollup doesn't understand cjs)
      commonjs(),
      // Allow node_modules resolution, so you can use 'external' to control
      // which external modules to include in the bundle
      // https://github.com/rollup/rollup-plugin-node-resolve#usage
      resolve(),

      // Resolve source maps to the original source
      sourceMaps(),
    ],
  }
}
