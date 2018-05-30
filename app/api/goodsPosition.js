const UploadPhotos = require('../libs/UploadPhotos');

exports.addProduct = function (req, res, next) {
	const { Model } = req.app;
	return Model.goodsPositions.add(req.body).then(([error, newProduct]) => {
		if (error) return { message: error.message, error };
		return { status: 'ok' }
	})
}

exports.delete = (req, res, next) => {
	const { Model } = req.app;
	return Model.goodsPositions.del(req.body).then(([error]) => {
		if (error) return { message: error.message, error };
		return { status: 'ok' }
	})
}

exports.upd = function (req, res, next) {
	const Model = req.app.Model;

	if (!!req.body.id === false) return { message: 'Отсутствует параметр id' };

	return Model.goodsPositions.upd(req.body).then(([error, result]) => {
		if (error) return { message: error.message, error };
		return { status: 'ok' }
	});
}

exports.getParamsValues = async function (req, res, next) {
	const data = req.body;
	const Model = req.app.Model;
	return Model.goodsPropsValues.get({ prop_id: data.prop_id }).then(([error, paramsValues]) => {
		return { status: 'ok', body: { paramsValues } }
	})
}

exports.addPropsBindValue = async function (req, res, next) {
	const data = req.body;
	const Model = req.app.Model;
	const { prop_id, good_id, prop_value_id } = data;
	return Model.goodsPropsBindValues.add({ prop_id, good_id, prop_value_id }).then(([error, result]) => {
		return { status: 'ok' }
	})
}

exports.addPropsvalues = async function (req, res, next) {
	const data = req.body;
	const Model = req.app.Model;

	const [propQueryError, prop_id] = await Model.goodsProps.add({ title: data.prop_title });
	if (propQueryError) return { status: 'bad', message: 'Что-то пошло не так. Обновите страницу и попробуйте ещё раз' };

	const [propValueQueryError, propValueQuery] = await Model.goodsPropsValues.add({ title: data.prop_value, prop_id });

	if (propValueQueryError) {
		await Model.goodsProps.del({ id: prop_id }).then(([error, result]) => {
			if (error) return { status: 'bad', message: 'Что-то пошло не так. Обновите страницу и попробуйте ещё раз' };
		});
	}

	return { status: 'ok' }
}

exports.deleteParamsBindValues = async function (req, res, next) {
	const data = req.body;
	const Model = req.app.Model;
	return Model.goodsPropsBindValues.del({ id: data.id }).then(([error, result]) => {
		if (error) return { status: 'bad', message: error.message, error }

		return { status: 'ok' };
	})
}

exports.setMainPhoto = function (req, res, next) {
	const Model = req.app.Model;
	const goodId = req.params.goodId;
	const photosPath = path.join(AppRoot, 'public', 'photos');

	return UploadPhotos(req, res, next, { pathToFolder: photosPath })
		.then((result) => {
			return Model.photos.add({ path: result.url, name: result.filename });
		})
		.then((result) => {
			return { status: 'ok', data: { photoId: result[1] } };
		})
		.catch(error => {
			console.log(error);
			return { status: 'bad', error, message: error.message }
		})
}

exports.addPhoto = (req, res, next) => {
	const Model = req.app.Model;
	const goodId = req.query.goodId;
	const photosPath = path.join(AppRoot, 'public', 'photos');
	const State = {
		photoId: null
	};
	return UploadPhotos(req, res, next, { pathToFolder: photosPath })
		.then((result) => {
			return Model.photos.add({ target: 'goodsPosition', target_id: goodId, path: result.url, name: result.filename });
		})
		.then(([error, photoId]) => {
			if(error) return Promise.reject(error);
			State.photoId = photoId;
			return Model.goodsPositions.get({ id: goodId });
		}).then(([error, goodsPos]) => {
			if (error) return Promise.reject(error);
			goodsPos = goodsPos[0];
			if (!!goodsPos.main_photo === false) {
				return Model.goodsPositions.upd({ target: 'main_photo', value: State.photoId, id: goodsPos.id });
			}

			return Promise.resolve([null]);
		}).then(([error]) => {
			if (error) return Promise.reject(error);
			return { status: 'ok' };
		})
		.catch(error => {
			console.log(error);
			return { status: 'bad', error, message: error.message }
		})
}