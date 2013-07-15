// 
// Accepts parameters:
// [1] -> URL to screen cap
// [2] -> Complete path to save screen cap
//
var system = require('system');
var url = system.args[1];
var output_path = system.args[2];

var page = require('webpage').create();
page.open(url, function() {
  page.render(output_path);
  phantom.exit();
});
