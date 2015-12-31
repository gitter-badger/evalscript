# EvalScript

[![Join the chat at https://gitter.im/Kocisov/evalscript](https://badges.gitter.im/Kocisov/evalscript.svg)](https://gitter.im/Kocisov/evalscript?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
**EvalScript** - Replace every thing in Javascript with Eval

Kappa/

# Usage
Install evalscript **globally**
```
npm install -g evalscript
```

Then use it with evalscript command

// file must be **es** extension
```
evalscript your-file.es
```

It will produce your-file.js

# What can I use? [Features]
At the moment u can use just some things ->
**List of features:**

## console.log
```
eval [anything / 1337 / "anything" / 'anything']
```

## if
```
eval([var = var | !var | var != var | var < var | var > var]) {
  // do something afterwards
  eval 1337
}
```

## basic math [+, -, *, /]
```
eval 3 + 3
eval 24 / 4
```
At the moment u can do only 2 numbers at once - Check ./examples/math.es

## create function
```
eval num 3

eval dw() {
  eval 3 * num
}
```

## alert
```
eval "alert message" !
eval 1337 !
```

## comments
There is regular comments in evalscript file but they are not compiled into dist file
```
// comment
/* comment */
```