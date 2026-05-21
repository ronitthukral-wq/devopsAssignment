const fs = require('fs');
const path = require('path');

module.exports = async function (context, req) {
  const html = fs.readFileSync(path.join(__dirname, '../index.html'), 'utf8');
  context.res = {
    status: 200,
    headers: { "Content-Type": "text/html" },
    body: html
  };
};