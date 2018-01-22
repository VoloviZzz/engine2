const { Model } = require('../models');

exports.add = async function (req, res, next) {
	const { fragment_id } = req.body;
	let slides = [];
	let lastId = 0;

	return await Model.fragments.getFragmentsData({ fragment_id }).then(([error, rowsData]) => {
		if (rowsData.length > 0) {
			slides = JSON.parse(rowsData[0].data).content.slides;
			lastId = JSON.parse(rowsData[0].data).content.lastId || 0;
		}

		slides.push({ id: ++lastId, img: "", img_bottom: "", title: "", title_bottom: '', description: `` });

		return Model.fragments.setData({ fragment_id, data: { slides, lastId } });
	}).then(([error, result]) => {
		return { status: 'ok' }
	});
}

exports.deleteSlide = async function (req, res, next) {
	const { fragment_id, slide_id } = req.body;

	return Model.fragments.getFragmentsData({ fragment_id }).then(([error, rowsData]) => {
		if(error) return Promise.reject(error);
		
		const slides = JSON.parse(rowsData[0].data).content.slides
		
		slides.some((slide, index) => slide.id == slide_id ? slides.splice(index, 1) : false)

		return Model.fragments.setData({ fragment_id, data: { slides } });
	}).then(([error, result]) => {
		if(error) return Promise.reject(error);
		
		return { status: 'ok' }
	})
	.catch(error => {
		return { status: 'bad', message: error.message }
	});
}

exports.updSlide = async function (req, res, next) {
	const { slide_id, fragment_id, target, value } = req.body;

	return Model.fragments.getFragmentsData({ fragment_id }).then(([error, rowsData]) => {
		if(error) return Promise.reject(error);
		const slides = JSON.parse(rowsData[0].data).content.slides
		
		slides.some((slide, index) => slide.id == slide_id ? slides[index][target] = value : false)

		return Model.fragments.setData({ fragment_id, data: { slides } });
	}).then(([error, result]) => {
		if(error) return Promise.reject(error);
		
		return { status: 'ok' }
	})
	.catch(error => {
		return { status: 'bad', message: error.message }
	});
}