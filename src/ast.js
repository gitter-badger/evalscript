var yy = module.exports = {
  ifStatement: function(first, second) {
    return '\nif(' + first + ') {' + second + '}\n';
  },

  printStatement: function(first) {
    return '\nconsole.log(' + first + ');\n';
  }
};
