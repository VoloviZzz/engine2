exports.addPostTarget = async (req, res, next) => {

	const { db } = req.app;

	try {
		await db.insertQuery(`INSERT INTO post_targets SET title = '${req.body.value}'`);
		return { status: 'ok' };
	} catch (error) {
		return { status: 'bad' };
	}
}

exports.addCat = async function (req, res, next) {
	const { db } = req.app;
	try {
		await db.insertQuery(`INSERT INTO post_categories SET target_id = '${req.body.targetId}', title = '${req.body.catName}'`);
		return { status: 'ok' };
	} catch (error) {
		return { status: 'bad', message: error.message };
	}
}

exports.addItem = async (req, res, next) => {
	const Model = req.app.Model;
	const addData = { creator: req.session.user.id };

	if ('target' in req.body === false) {
		return { status: 'bad', message: 'Отсутствует параметр target' };
	}

	addData.target = req.body.target;
	
	if(req.body.categoryId !== '') {
		addData.category = req.body.categoryId;
	}

	return Model.posts.add(addData).then(([error, rows]) => {
		if (error) return { message: error.message }
		return { status: 'ok' };
	})
}

exports.deleteItem = (req, res, next) => {
	const Model = req.app.Model;
	return Model.posts.del({ id: req.body.id }).then(([error, rows]) => {

		if (error) return { message: error.message }
		return { status: 'ok' };
	})
}

exports.upd = (req, res, next) => {
	const Model = req.app.Model;
	return Model.posts.upd(req.body).then(([error, rows]) => {
		if (error) return { message: error.message, error }
		return { status: 'ok' };
	})
}

exports.publicate = async (req, res, next) => {

	const Model = req.app.Model;

	var [error, rows] = await Model.posts.upd(req.body)
	if (error) return { message: error.message, error };

	if (req.body.value == '1') {
		var [error] = await Model.posts.upd({ target: 'published', value: Date.now(), id: req.body.id })
		if (error) return { message: error.message, error }
	}

	return { status: 'ok' };
}