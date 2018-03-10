module.exports = function (req, res, next) {
	// set locals, only providing error in development
	res.locals.message = err.message;
	res.locals.error = req.app.get('env') === 'development' ? err : {};

	// render the error page
	res.status(err.status || 500);

	if (req.xhr) {
		return res.json({ message: err.message });
	} else {
		return res.render('error');
	}
}