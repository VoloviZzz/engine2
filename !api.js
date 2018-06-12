module.exports = {
	
	searchDead : (req, data) => {		// поиск захоронений
		
		Log.view('Запуск контроллера ' + 'searchDead'.bgBlue + ' на маршруте ' + 'api'.bgBlue);
		
		return new Promise((resolve, reject) => {
			
			Chain()
				.then(() => {

					Log.view('Проверка входных параметров');
					var d = data.data;
					console.log(data);
					
					if (typeof d.search_mode !== "undefined" && d.search_mode == "advanced") {
					}
					else {
						if (typeof data.str == "undefined" || data.str == '') {
							throw new Error('Задан пустой запрос: ' + data.str);
						}						
						data.str = '%' + data.str.split(' ').join('%') + '%';
					}
					
				
				})
				
				.then(() => {
					if (data.data.part == 0) {
						Log.view('Запрос количества результатов');
						
						var d = data.data;
						if (typeof d.search_mode !== "undefined" && d.search_mode == "advanced") {
							
							var surname = '',
								firstname = '',
								patronymic = '',
								placeNumber = '',
								graveNumber = '',
								cemetery = '',
								bornDay = '',
								bornMonth = '',
								bornYear = '',
								dieDay = '',
								dieMonth = '',
								dieYear = '';
								
							if (typeof d.surname !== "undefined" && d.surname !== '') surname = `AND surname LIKE '%${d.surname}%'`;
							if (typeof d.firstname !== "undefined" && d.firstname !== '') firstname = `AND firstname LIKE '%${d.firstname}%'`;
							if (typeof d.patronymic !== "undefined" && d.patronymic !== '') patronymic = `AND patronymic LIKE '%${d.patronymic}%'`;
							if (typeof d.graveNumber !== "undefined" && d.graveNumber !== '') {
								graveNumber = `AND id = '${d.graveNumber}'`;
							}
							else if (typeof d.placeNumber !== "undefined" && d.placeNumber !== '') {
								placeNumber = `AND place = '${d.placeNumber}'`;
							}
							if (typeof d.cemetery !== "undefined" && d.cemetery !== '') cemetery = `AND cemetery = '${d.cemetery}'`;

							if (typeof d.bornDay !== "undefined" && d.bornDay !== '') bornDay = `AND born_day = '${d.bornDay}'`;
							if (typeof d.bornMonth !== "undefined" && d.bornMonth !== '') bornMonth = `AND born_month = '${d.bornMonth}'`;
							if (typeof d.bornYear !== "undefined" && d.bornYear !== '') bornYear = `AND born_year = '${d.bornYear}'`;

							if (typeof d.dieDay !== "undefined" && d.dieDay !== '') dieDay = `AND die_day = '${d.dieDay}'`;
							if (typeof d.dieMonth !== "undefined" && d.dieMonth !== '') dieMonth = `AND die_month = '${d.dieMonth}'`;
							if (typeof d.dieYear !== "undefined" && d.dieYear !== '') dieYear = `AND die_year = '${d.dieYear}'`;
								
							var q = `
								SELECT COUNT(id) as count
								FROM graves
								WHERE exhumation IS NULL
									AND no_public = 0
									AND unowned = 0
									${surname}
									${firstname}
									${patronymic}
									${placeNumber}
									${graveNumber}
									${cemetery}
									${bornDay}
									${bornMonth}
									${bornYear}
									${dieDay}
									${dieMonth}
									${dieYear}
							`;
							console.log(q);
							return req.db.q(q);
						}
						else {
							return req.db.q(`
								SELECT COUNT(id) as count
								FROM graves
								WHERE exhumation IS NULL
									AND no_public = 0
									AND unowned = 0
									AND CONCAT(surname, ' ', firstname, ' ', patronymic) LIKE '${data.str}'
							`);
						}
					}
				})
				.then(count => {
					if (data.data.part == 0) {
						// console.log(count);
						data.count = count[0].count;
					}
				})
				
				.then(() => {		
					
					Log.view('Запрос списка захоронений');
							
					var d = data.data;
					if (typeof d.search_mode !== "undefined" && d.search_mode == "advanced") {
						var q = {
								nogroup : true,
								exhumation : 'NULL',
								unowned : 0,
								limit : (data.data.part * 20) + ',20',
							};
						
						if (typeof d.surname !== "undefined" && d.surname !== '') q.surnameLike = d.surname;
						if (typeof d.firstname !== "undefined" && d.firstname !== '') q.firstnameLike = d.firstname;
						if (typeof d.patronymic !== "undefined" && d.patronymic !== '') q.patronymicLike = d.patronymic;
						if (typeof d.graveNumber !== "undefined" && d.graveNumber !== '') {
							q.id = d.graveNumber;
						}
						else if (typeof d.placeNumber !== "undefined" && d.placeNumber !== '') {
							q.place = d.placeNumber;
						}
						if (typeof d.cemetery !== "undefined" && d.cemetery !== '') q.cemetery = d.cemetery;
						if (typeof d.bornDay !== "undefined" && d.bornDay !== '') q.bornDay = d.bornDay;
						if (typeof d.bornMonth !== "undefined" && d.bornMonth !== '') q.bornMonth = d.bornMonth;
						if (typeof d.bornYear !== "undefined" && d.bornYear !== '') q.bornYear = d.bornYear;
						if (typeof d.dieDay !== "undefined" && d.dieDay !== '') q.dieDay = d.dieDay;
						if (typeof d.dieMonth !== "undefined" && d.dieMonth !== '') q.dieMonth = d.dieMonth;
						if (typeof d.dieYear !== "undefined" && d.dieYear !== '') q.dieYear = d.dieYear;
						
						return req.db.gravesGet(q);
					}
					else {
						return req.db.gravesGet({
							str : data.str || '123',
							exhumation : 'NULL',
							unowned : 0,
							noPublic : 0,
							limit : (data.data.part * 20) + ',20',
						});
					}
					
				})
				.then(graves => {
					
					Log.view('Обработка списка захоронений');

					if (graves) {
						// console.log(graves);
						var gravesIds = [],
							placesIds = [];
						for (id in graves) {
							gravesIds.push(id);
							if (graves[id].place) placesIds.push(graves[id].place);
						}
						data.gravesIds = gravesIds;
						data.placesIds = placesIds.length > 0 ? placesIds : false;
						data.graves = graves;
					}
					else {
						data.placesIds = false;
						data.gravesIds = false;
						data.graves = {};
					}					
					
				})
				
				.then(() => {
					if (data.placesIds) {						
						Log.view('Запрос соседних захоронений');
						return req.db.gravesGet({
							placesIds : data.placesIds.join(','),
						});
					}
				})
				.then(nearGraves => {
					if (data.placesIds && nearGraves) {						
						Log.view('Обработка списка соседних захоронений');
						for (id in nearGraves) {
							var g = nearGraves[id];
							for (id in data.graves) {
								var grave = data.graves[id];
								if (grave.place == g.place && grave.id !== g.id) {
									if (!grave['near']) grave['near'] = {};
									grave['near'][g.id] = g;
									break;
								}
								data.graves[id] = grave;
							}
						}
					}
				})
				
				.then(() => {
					
					if (data.gravesIds) {
						
						Log.view('Запрос фотографий захоронений');
						
						return req.db.photosRelGet({
							targetTypes : '1,2',
							targetIds : data.gravesIds.join(','),
							order : 'ss.created ASC',
							// group : 'pr.target_id',
						});
					
					}
					
				})
				.then(rels => {
					
					Log.view('Обработка фото');
					
					// console.log(rels);
					
					var o = {};
					for (id in rels) {
						var rel = rels[id];
						// console.log(rel);
						if (!o[rel.target_id]) o[rel.target_id] = {};
						o[rel.target_id][rel.id] = rel;
					}
					// console.log(o);
					var r = {};
					for (id in o) {
						var obj = o[id];
						// console.log(o[id]);
						var maxTime = 0,
							lastRel = false;
						for (i in obj) {
							// console.log(o[id][i]);
							var rel = obj[i],
								time = new Date(rel.survey_created).getTime();
							// console.log(time);
							if (time > maxTime) lastRel = rel;
						}
						r[lastRel.id] = lastRel;
					}
					rels = r;
					
					if (data.gravesIds) {
						
						// console.log(data.gravesIds);
						
						Log.view('Обработка фотографий захоронений');
						
						for (id in rels) {
							var rel = rels[id];
							rel.photo_preview = `surveys/${rel.survey}/preview/${rel.name}`;
							rel.photo_prod = `surveys/${rel.survey}/prod/${rel.name}`;
							rel.photo_origin = `surveys/${rel.survey}/origin/${rel.name}`;
							// console.log(rel);
							// Log.delim();
							data.graves[rel.target_id].rel = rel;
						}
					
					}
					
				})
				
				.then(() => {		// отправка результата
					resolve({ status : 'ok', graves : data.graves, count : data.count });
				})
				.catch(error => {
					reject(error);
					// reject({ status : 'bad', error : error.toString() });
				});
			
		});
		
	},
	
	getCemeteries : (req, data) => {
		
		Log.view('Запуск контроллера ' + 'getCemeteries'.bgBlue + ' на маршруте ' + 'api'.bgBlue);
		
		return new Promise((resolve, reject) => {
			
			Chain()
				.then(() => {
					Log.view('Проверка входных параметров');
					data.req = {};
					if (data.data.id) data.req.id = data.data.id;
				})
				.then(() => {
					Log.view('Запрос списка кладбищ');
					return req.db.cemeteriesGet(data.req);
				})
				.then(cemeteries => {
					Log.view('Обработка списка кладбищ');
					data.cemeteries = cemeteries;
				})
				
				.then(() => {
					if (data.data.id) {
						return req.db.roadsGet({ cemetery : data.data.id, });
					}
				})
				.then(roads => {
					if (data.data.id) {
						// console.log(data.cemeteries);
						data.cemeteries.roads = roads;
					}
				})
				
				.then(() => {
					if (data.data.id) {
						Log.view('Запрос списка кварталов');
						return req.db.areasGet({ cemetery : data.data.id, });
					}
				})
				.then(areas => {
					if (data.data.id) {
						data.cemeteries.areas = areas;
					}
				})
				
				.then(() => {
					if (data.data.id) {
						Log.view('Запрос списка объектов');
						return req.db.objectsGet({ cemetery : data.data.id, });
					}
				})
				.then(objects => {
					if (data.data.id) {
						data.cemeteries.objects = objects;
					}
				})
				
				
				.then(() => {
					Log.view('Отправка результата');
					resolve({ status : 'ok', cemeteries : data.cemeteries });
				});
				
		});
		
	},
	
	getUnindent : (req, data) => {
		
		Log.view('Запуск контроллера ' + 'getUnindent'.bgBlue + ' на маршруте ' + 'api'.bgBlue);
		
		return new Promise((resolve, reject) => {
			
			Chain()
				.then(() => {
					Log.view('Проверка входных параметров');
					if (typeof data.data.cemetery == "undefined") throw new Error('Не указано кладбище');
					if (typeof data.data.part == "undefined") throw new Error('Не указан номер секции');
				})
				
				.then(() => {
					if (data.data.part == 0) {
						Log.view('Запрос количества захоронений');
						return req.db.q(`SELECT count(id) as count FROM graves WHERE cemetery = ${data.data.cemetery} AND rat_unknown = 1`);
					}
				})
				.then(count => {
					if (data.data.part == 0) {
						data.count = count[0].count;
					}
				})
				
				.then(() => {
					Log.view('Запрос списка захоронений');
					return req.db.gravesGet({
						cemetery : data.data.cemetery,
						ratUnknown : 1,
						limit : (data.data.part * 20) + ',20',
					});
				})
				.then(graves => {
					Log.view('Обработка списка захоронений');
					if (graves) {
						var gravesIds = [],
							placesIds = [];
						for (id in graves) {
							gravesIds.push(id);
							if (graves[id].place) placesIds.push(graves[id].place);
						}
						data.gravesIds = gravesIds;
						data.placesIds = placesIds.length > 0 ? placesIds : false;
						data.graves = graves;
					}
					else {
						data.placesIds = false;
						data.gravesIds = false;
						data.graves = {};
					}					
				})
				.then(() => {
					if (data.placesIds) {						
						Log.view('Запрос соседних захоронений');
						return req.db.gravesGet({
							placesIds : data.placesIds.join(','),
						});
					}
				})
				.then(nearGraves => {
					if (data.placesIds && nearGraves) {						
						Log.view('Обработка списка соседних захоронений');
						for (id in nearGraves) {
							var g = nearGraves[id];
							for (id in data.graves) {
								var grave = data.graves[id];
								if (grave.place == g.place && grave.id !== g.id) {
									if (!grave['near']) grave['near'] = {};
									grave['near'][g.id] = g;
									break;
								}
								data.graves[id] = grave;
							}
						}
					}
				})
				
				.then(() => {
					
					if (data.gravesIds) {
						
						Log.view('Запрос фотографий захоронений');
						
						return req.db.photosRelGet({
							targetTypes : '1,2',
							targetIds : data.gravesIds.join(','),
							order : 's.created DESC',
							group : 'pr.target_id',
						});
					
					}
					
				})
				.then(rels => {
					
					if (data.gravesIds) {
						
						// console.log(data.gravesIds);
						
						Log.view('Обработка фотографий захоронений');
						
						for (id in rels) {
							var rel = rels[id];
							rel.photo_preview = `surveys/${rel.survey}/preview/${rel.name}`;
							rel.photo_prod = `surveys/${rel.survey}/prod/${rel.name}`;
							rel.photo_origin = `surveys/${rel.survey}/origin/${rel.name}`;
							// console.log(rel);
							// Log.delim();
							data.graves[rel.target_id].rel = rel;
						}
					
					}
					
				})
				.then(() => {
					Log.view('Отправка результата');
					resolve({ status : 'ok', count : data.count, graves : data.graves });
				});
			
		});
		
	},
	
	getUnnamed : (req, data) => {
		
		Log.view('Запуск контроллера ' + 'getUnnamed'.bgBlue + ' на маршруте ' + 'api'.bgBlue);
		
		return new Promise((resolve, reject) => {
			
			Chain()
				.then(() => {
					// console.log(data);
					Log.view('Проверка входных параметров');
					if (typeof data.data.cemetery == "undefined") throw new Error('Не указано кладбище');
					if (typeof data.data.part == "undefined") throw new Error('Не указан номер секции');
				})
				
				.then(() => {
					if (data.data.part == 0) {
						Log.view('Запрос количества захоронений');
						return req.db.q(`SELECT count(id) as count FROM graves WHERE cemetery = ${data.data.cemetery} AND rat_noname = 1`);
					}
				})
				.then(count => {
					if (data.data.part == 0) {
						data.count = count[0].count;
					}
				})
				
				.then(() => {
					Log.view('Запрос списка захоронений');
					return req.db.gravesGet({
						cemetery : data.data.cemetery,
						ratNoname : 1,
						// surname : '',
						// firstname : '', 
						// patronymic : '',
						limit : (data.data.part * 20) + ',20',
					});
				})
				.then(graves => {
					Log.view('Обработка списка захоронений');
					if (graves) {
						var gravesIds = [],
							placesIds = [];
						for (id in graves) {
							gravesIds.push(id);
							if (graves[id].place) placesIds.push(graves[id].place);
						}
						data.gravesIds = gravesIds;
						data.placesIds = placesIds.length > 0 ? placesIds : false;
						data.graves = graves;
					}
					else {
						data.placesIds = false;
						data.gravesIds = false;
						data.graves = {};
					}					
				})
				.then(() => {
					if (data.placesIds) {						
						Log.view('Запрос соседних захоронений');
						return req.db.gravesGet({
							placesIds : data.placesIds.join(','),
						});
					}
				})
				.then(nearGraves => {
					if (data.placesIds && nearGraves) {						
						Log.view('Обработка списка соседних захоронений');
						for (id in nearGraves) {
							var g = nearGraves[id];
							for (id in data.graves) {
								var grave = data.graves[id];
								if (grave.place == g.place && grave.id !== g.id) {
									if (!grave['near']) grave['near'] = {};
									grave['near'][g.id] = g;
									break;
								}
								data.graves[id] = grave;
							}
						}
					}
				})
				
				.then(() => {
					
					if (data.gravesIds) {
						
						Log.view('Запрос фотографий захоронений');
						
						return req.db.photosRelGet({
							targetTypes : '1,2',
							targetIds : data.gravesIds.join(','),
							order : 's.created DESC',
							group : 'pr.target_id',
						});
					
					}
					
				})
				.then(rels => {
					
					if (data.gravesIds) {
						
						// console.log(data.gravesIds);
						
						Log.view('Обработка фотографий захоронений');
						
						for (id in rels) {
							var rel = rels[id];
							rel.photo_preview = `surveys/${rel.survey}/preview/${rel.name}`;
							rel.photo_prod = `surveys/${rel.survey}/prod/${rel.name}`;
							rel.photo_origin = `surveys/${rel.survey}/origin/${rel.name}`;
							// console.log(rel);
							// Log.delim();
							data.graves[rel.target_id].rel = rel;
						}
					
					}
					
				})				.then(() => {
					Log.view('Отправка результата');
					resolve({ status : 'ok', count : data.count, graves : data.graves });
				});
			
		});
		
	},
	
	getDead : (req, data) => {
		
		Log.view('Запуск контроллера ' + 'getDead'.bgBlue + ' на маршруте ' + 'api'.bgBlue);
		
		return new Promise((resolve, reject) => {
			
			Chain()
				.then(() => {
					Log.view('Проверка входных параметров');
					if (typeof data.data.id == "undefined") throw new Error('Не указан идентификатор захоронения');
				})
				
				.then(() => {
					Log.view('Запрос данных захоронения');
					return req.db.gravesGet({
						id : data.data.id,
					});
				})
				.then(grave => {
					Log.view('Обработка данных захоронения');
					data.grave = grave;
				})
				
				.then(() => {
					Log.view('Запрос данных кладбища');
					return req.db.cemeteriesGet({ id : data.grave.cemetery });
				})
				.then(cemetery => {
					data.grave.cemeteryData = cemetery;
				})
				
				.then(() => {
					Log.view('Запрос списка дорог');
					return req.db.roadsGet({ cemetery : data.grave.cemetery });
				})
				.then(roads => {
					data.grave.cemeteryData.roads = roads;
				})
				
				.then(() => {
					Log.view('Запрос списка кварталов');
					return req.db.areasGet({ cemetery : data.grave.cemetery, });
				})
				.then(areas => {
					data.grave.cemeteryData.areas = areas;
				})
				
				.then(() => {
					Log.view('Запрос списка объектов');
					return req.db.objectsGet({ cemetery : data.grave.cemetery, });
				})
				.then(objects => {
					data.grave.cemeteryData.objects = objects;
				})
				
				.then(() => {
					Log.view('Запрос фотографий захоронения');
					return req.db.photosRelGet({
						targetTypes : data.grave.place ? '1' : '2',
						targetIds : [data.grave.id].join(','),
					});
				})
				.then(rels => {
					Log.view('Обработка фотографий захоронения');
					if (rels) {
						// определение последнего сета
						var lastSurvey = false,
							maxTime = 0;
						for (id in rels) {
							var rel = rels[id],
								time = new Date(rel.survey_created).getTime();
							if (time > maxTime) lastSurvey = rel.survey;
						}
						// выборка фотографий только последнего сета
						var rls = {};
						for (id in rels) {
							if (rels[id].survey == lastSurvey) rls[id] = rels[id];
						}
						rels = rls;
						var surveys = {};
						for (id in rels) {
							var rel = rels[id];
							console.log(rel);
							Log.delim();
							rel.photo_preview = `surveys/${rel.survey}/preview/${rel.name}`;
							rel.photo_prod = `surveys/${rel.survey}/prod/${rel.name}`;
							rel.photo_origin = `surveys/${rel.survey}/origin/${rel.name}`;
							if (!data.grave.mainphoto) data.grave.mainphoto = rel;
							if (!surveys[rel.survey]) {
								surveys[rel.survey] = { name : rel.photographer_name, date : rel.date, rels : {} };
							}
							surveys[rel.survey].rels[rel.id] = rel;
						}
					}
					else {
						var surveys = false;
					}
					data.grave.surveys = surveys;
					
				})
				
				.then(() => {
					Log.view('Отправка результата');
					resolve({ status : 'ok', grave : data.grave });
				});
			
		});
		
	},
	
	getDeads : (req, data) => {
		
		Log.view('Запуск контроллера ' + 'getDeads'.bgBlue + ' на маршруте ' + 'api'.bgBlue);
		
		return new Promise((resolve, reject) => {
			
			Chain()
				.then(() => {
					Log.view('Проверка входных параметров');
					if (typeof data.data.ids == "undefined") throw new Error('Не указаны идентификаторы захоронений');
				})
				
				.then(() => {
					Log.view('Запрос данных захоронений');
					return req.db.gravesGet({ ids : data.data.ids, });
				})
				.then(graves => {
					Log.view('Обработка данных захоронений');
					data.gravesIds = [];
					for (id in graves) data.gravesIds.push(id);
					data.graves = graves;
				})
								
				.then(() => {
					Log.view('Запрос фотографий захоронениий');
					return req.db.photosRelGet({
						targetTypes : '1,2',
						targetIds : data.gravesIds.join(','),
					});
				})
				.then(rels => {
					Log.view('Обработка фотографий захоронений');
					if (rels) {
						for (id in rels) {
							var rel = rels[id];
							if (!data.graves[rel.target_id].rels) data.graves[rel.target_id].rels = {};
							data.graves[rel.target_id].rels[id] = rel;
						}
					}					
				})
				
				.then(() => {
					Log.view('Отправка результата');
					resolve({ status : 'ok', graves : data.graves, });
				});
			
		});
		
	},
	
	getPlace : (req, data) => {
		
		Log.view('Запуск контроллера ' + 'getPlace'.bgBlue + ' на маршруте ' + 'api'.bgBlue);
		
		return new Promise((resolve, reject) => {
			
			Chain()
				.then(() => {
					Log.view('Проверка входных параметров');
					if (typeof data.data.id == "undefined") throw new Error('Не указан идентификатор участка');
				})
				
				.then(() => {
					Log.view('Запрос данных участка');
					return req.db.placesGet({
						id : data.data.id,
					});
				})
				.then(place => {
					Log.view('Обработка данных участка');
					data.place = place;
				})
				
				.then(() => {
					Log.view('Запрос данных кладбища');
					return req.db.cemeteriesGet({ id : data.place.cemetery });
				})
				.then(cemetery => {
					data.place.cemeteryData = cemetery;
				})
				
				.then(() => {
					Log.view('Запрос списка дорог');
					return req.db.roadsGet({ cemetery : data.place.cemetery });
				})
				.then(roads => {
					data.place.cemeteryData.roads = roads;
				})
				
				.then(() => {
					Log.view('Запрос списка кварталов');
					return req.db.areasGet({ cemetery : data.place.cemetery, });
				})
				.then(areas => {
					data.place.cemeteryData.areas = areas;
				})
				
				.then(() => {
					Log.view('Запрос списка объектов');
					return req.db.objectsGet({ cemetery : data.place.cemetery, });
				})
				.then(objects => {
					data.place.cemeteryData.objects = objects;
				})
				
				.then(() => {
					Log.view('Запрос списка захоронений');
					return req.db.gravesGet({place : data.place.id});
				})
				.then(graves => {
					
					var total = 0,
					gravesIds = [];
					
					if (graves) {						
						for (id in graves) {
							var number = String(id);
							while (number.length < 7) number = '0' + number;
							graves[id].number = number;
							total++;
							gravesIds.push(id);
						}
					}
					
					data.place.graves = {
						list : graves,
						gravesIds : gravesIds,
						total : total,
					}
					
				})
				
				.then(() => {
					Log.view('Запрос фотографий участка');
					return req.db.photosRelGet({
						targetTypes : '0',
						targetIds : [data.place.id].join(','),
					});
				})
				.then(rels => {
					Log.view('Обработка фотографий участка');
					if (rels) {
						
						var lastSurvey = false,
							maxTime = 0;
						for (id in rels) {
							var rel = rels[id],
								time = new Date(rel.survey_created).getTime();
							if (time > maxTime) lastSurvey = rel.survey;
						}
						// выборка фотографий только последнего сета
						var rls = {};
						for (id in rels) {
							if (rels[id].survey == lastSurvey) rls[id] = rels[id];
						}
						rels = rls;
						
						var surveys = {};
						for (id in rels) {
							var rel = rels[id];
							rel.photo_preview = `surveys/${rel.survey}/preview/${rel.name}`;
							rel.photo_prod = `surveys/${rel.survey}/prod/${rel.name}`;
							rel.photo_origin = `surveys/${rel.survey}/origin/${rel.name}`;
							if (!data.place.mainphoto) data.place.mainphoto = rel;
							if (!surveys[rel.survey]) {
								surveys[rel.survey] = { name : rel.photographer_name, date : rel.date, rels : {} };
							}
							surveys[rel.survey].rels[rel.id] = rel;
						}
					}
					else {
						var surveys = false;
					}
					data.place.surveys = surveys;
				})
				
				.then(() => {
					
					if (data.place.graves.total > 0) {
						
						Log.view('Запрос фотографий захоронений');
						
						return req.db.photosRelGet({
							targetTypes : '1',
							targetIds : data.place.graves.gravesIds.join(','),
							order : 's.created DESC',
							group : 'pr.target_id',
						});
					
					}
					
				})
				.then(rels => {
					if (data.place.graves.total > 0) {
						Log.view('Обработка фотографий захоронений');
						for (id in rels) {
							var rel = rels[id];
							rel.photo_preview = `surveys/${rel.survey}/preview/${rel.name}`;
							rel.photo_prod = `surveys/${rel.survey}/prod/${rel.name}`;
							rel.photo_origin = `surveys/${rel.survey}/origin/${rel.name}`;
							data.place.graves.list[rel.target_id].rel = rel;
						}
					}
				})
				
				.then(() => {
					Log.view('Отправка результата');
					resolve({ status : 'ok', place : data.place });
				});
			
		});
		
	},
	
}