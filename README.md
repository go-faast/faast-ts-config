# faast-ts-config

Common typescript configs

## Usage

```bash
npm i -D go-faast/faast-ts-config
```

### For Libraries

`tsconfig.json`:

```json
{
  "extends": "faast-ts-config/tsconfig.library.json",
  "compilerOptions": {
    "outDir": "dist/lib",
    "declarationDir": "dist/types"
  },
  "include": [
    "src"
  ]
}
```

`tslint.json`:

```json
{
  "extends": [
    "faast-ts-config/tslint.library.json"
  ]
}

```

### For Servers

`tsconfig.json`:

```json
{
  "extends": "faast-ts-config/tsconfig.server.json",
  "include": [
    "src"
  ]
}
```

`tslint.json`:

```json
{
  "extends": [
    "faast-ts-config/tslint.server.json"
  ]
}

```

### For React Frontends (using webpack)

`tsconfig.json`:

```json
{
  "extends": "faast-ts-config/tsconfig.react.json",
  "include": [
    "src"
  ]
}
```

`tslint.json`:

```json
{
  "extends": [
    "faast-ts-config/tslint.react.json"
  ]
}

```
