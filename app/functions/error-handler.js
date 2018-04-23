module.exports = function (err, req, res, next) {
	// set locals, only providing error in development
	res.locals.message = err.message;
	res.locals.error = req.app.get('env') === 'development' ? err : {};

	// render the error page
	res.status(err.status || 500);

	res.locals.route = res.locals.route || { title: 'Что-то пошло не так' };
	res.locals.session = req.session;

	if (req.xhr) {
		return res.json({ message: err.message });
	} else {
		return res.render('error');
	}
}