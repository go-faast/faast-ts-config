# faast-ts-config

Common typescript config

## Usage

```bash
npm i -D go-faast/faast-ts-config
```

Extend the files needed.

### Examples

`jest.config.js`

```javascript
const base = require('@faast/ts-config/library/jest.config.js')

module.exports = Object.assign({}, base, {
  // overrides here
})
```

`tsconfig.json`

```json
{
  "extends": "@faast/ts-config/library/tsconfig.json",
  "compilerOptions": {
    "baseUrl": ".",
    "outDir": "dist/lib",
    "declarationDir": "dist/types",
    "paths": {
      "#/*": ["./src/*"],
    }
  },
  "exclude": ["node_modules", "dist"]
}
```

## Templates

To initialize a new project from scratch copy the entire template directory. If migrating an existing project you'll need to copy over only desired files manually to avoid overwriting src and package.json.

### For Libraries

```bash
cp -r ./template/library/. /path/to/empty/project
```

### For Servers

```bash
cp -r ./template/server/. /path/to/empty/project
```

### For React Frontends (using webpack)

```bash
cp -r ./template/react/. /path/to/empty/project
```
