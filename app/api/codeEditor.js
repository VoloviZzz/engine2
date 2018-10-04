var fs = require("fs");


exports.getFS = (req, res, next) => {

}
exports.addFile = (req, res, next) => {
	fs.writeFile('app/components/'+req.body.component+'/'+req.body.file+'', '');
	return { status: 'ok' }
}

exports.setFS = (req, res, next) => {
	fs.writeFile('app/components/'+req.body.component+'/template.ejs', req.body.template);
	fs.writeFile('app/components/'+req.body.component+'/index.js', req.body.index);
	fs.writeFile('app/public/js/'+req.body.component+'.js', req.body.js);
	fs.writeFile('app/public/css/'+req.body.component+'.css', req.body.css);
	return { status: 'ok' }
}
