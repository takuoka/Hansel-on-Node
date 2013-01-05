
/*
 * GET home page.
 */

exports.index = function(req, res){
  res.render('jade/index.jade', { title: 'Express' });
};