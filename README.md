# EvalScript
EvalScript - Replace everything in Javascript with Eval
// Kappa/

# Usage
Install evalscript globally
```
npm install -g evalscript
```

Then use it with evalscript command // file must be **es** extension
```
evalscript your-file.es
```

It will produce your-file.js

# What can I use?
At the moment u can use just 2 things:

## console.log
```
eval [anything / 1337 / "anything" / 'anything']
```

## if
```
eval([!var / var != var / var < var / var > var]) {
  eval 1337
}
```