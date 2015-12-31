var yy = module.exports = {
  ifStatement: function(first, second) {
    return 'if(' + first + ') {\n' + second + '}\n';
  },

  printStatement: function(first) {
    return 'console.log(' + first + ');';
  },

  setVar: function(name, value) {
    return 'var ' + name + ' = ' + value + ';\n';
  },

  createFunc: function(name, dothis) {
    return '\nvar ' + name + ' = function() {\n' + dothis + '\n}\n';
  }
};
