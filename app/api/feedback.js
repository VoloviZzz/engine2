exports.add = async (req, res, next) => {
	const { feedback } = req.app.Model;

	return feedback.add(req.body).then(([error, result]) => {
		if (error) return { status: 'bad', message: error.message, error };

		return { status: 'ok' };
	})
}