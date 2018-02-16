module.exports = async app => {

	const Model = app.Model;
	const [, socialLinks] = await Model.socialLinks.get();

	app.socialLinks = app.locals.socialLinks = {
		socialLinks,

		get() {
			return this.socialLinks;
		},

		add({ title = '', href = '', icon = 'fa-question' }) {
			return Model.socialLinks.add().then(async ([error, linkid]) => {
				[, this.socialLinks] = await Model.socialLinks.get();
			})
		},

		upd({ id, target, value }) {
			return Model.socialLinks.upd({ id, target, value }).then(async ([error, linkid]) => {
				[, this.socialLinks] = await Model.socialLinks.get();
			})
		},

		del({ id }) {
			return Model.socialLinks.del({ id }).then(async ([error, linkid]) => {
				[, this.socialLinks] = await Model.socialLinks.get();
			})
		}
	};

	app.post('/api/socialLinks/add', (req, res, next) => {
		app.socialLinks.add({});
		return res.send({ status: 'ok' });
	});

	app.post('/api/socialLinks/upd', (req, res, next) => {
		app.socialLinks.upd(req.body);
		return res.send({ status: 'ok' });
	});

	app.post('/api/socialLinks/del', (req, res, next) => {
		app.socialLinks.del(req.body);
		return res.send({ status: 'ok' });
	});
}
