module.exports = async app => {

	const Model = app.Model;
	var [, configs] = await Model.siteConfig.get();
	var configs = configs;

	app.siteConfig = app.locals.siteConfig = {
		configs,
		get(target) {
			const configItem = this.configs.find(configItem => configItem.target === target);
			return !!configItem ? configItem.value : '';
		},

		async refresh() {
			var result = await Model.siteConfig.get();
			this.configs = result[1];
			return configs;
		},

		async set({ target, value, title = '' }) {
			const configItemIndex = this.configs.findIndex(configItem => configItem.target === target);

			if (configItemIndex < 0) {
				return await Model.siteConfig.add({ title, target, value }).then(() => {
					this.configs.push({ target, value });
				})
			}

			let { id } = this.configs[configItemIndex];

			Model.siteConfig.setValue({ target, value }).then(([error]) => {
				if (error) throw error;

				Object.assign(this.configs[configItemIndex], { target, value });
			})
		}
	}
}
