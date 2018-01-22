const {Model} = require('../models');

exports.add = async function(req, res, next) {
	const {fragment_id} = req.body;
	let slides = [];

	return await Model.fragments.getFragmentsData({fragment_id}).then(([error, rowsData]) => {
		if(rowsData.length > 0) {
			slides = JSON.parse(rowsData[0].data).content.slides
		}

		slides.push({img: "", img_bottom: "", title: "", title_bottom: '', description: ``});

		return Model.fragments.setData({fragment_id, data: {slides}});
	}).then(([error, result]) => {
		return {status: 'ok'}
	});
}