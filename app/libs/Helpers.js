var ejs = require('ejs'); const path = require('path');
const fs = require('fs');

module.exports = {
	
	checkPhoto(photoPath) {
		photoPath = path.join(__dirname, 'public', photoPath);
		let photoStat;

		try {
			photoStat = fs.statSync(photoPath);

			if(photoStat.isFile() == false) {
				throw new Error();
			}

			return true;
		}
		catch(e) {
			return false;
		}
	},

	formatCoast(coast) {
		let str = `${coast}`;
		return str.replace(/(\d)(?=(\d\d\d)+([^\d]|$))/g, '$1 ');
	},

	// вывод даты в заданном формате
	formatDate(date, format) {
		var resultDateTime = format;
		var d = new Date(date);
		
		var monthsLong = ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"];
		var monthsShort = ["Янв.", "Февр.", "Март", "Апр.", "Май", "Июнь", "Июль", "Авг.", "Сен.", "Окт.", "Ноя.", "Дек."];
		var daysLong = ["Понедельник","Вторник","Среда","Четверг","Пятница","Суббота","Воскресенье"];
		var daysShort = ["Пн.","Вт.","Ср.","Чт.","Пт.","Сб.","Вс."];
		
		var yearRegExp = d.getFullYear();
		var monthRegExp = (String(d.getMonth() + 1).length == 1) ? ("0" + (d.getMonth() + 1)) : (d.getMonth() + 1);
		var lognMonthRegExp = monthsLong[d.getMonth()];
		var dayRegExp = (d.getDate().toString().length == 1) ? ("0" + d.getDate()) : d.getDate();
		var dayNameRegExp = (d.getDay() == 0) ? (6) : (d.getDay() - 1);
		
		var hoursRegExp = (d.getHours().toString().length == 1) ? ("0" + d.getHours()) : d.getHours();
		var minuteRegExp = (d.getMinutes().toString().length == 1) ? ("0"+ d.getMinutes()) : d.getMinutes();
		var secondsRegExp = (d.getSeconds().toString().length ==1) ? ("0"+ d.getSeconds()) : d.getSeconds();
		var milisecondsRegExp = (d.getMilliseconds().toString().length == 1) ? ("00" + d.getMilliseconds()) : ((d.getMilliseconds().toString().length == 2) ? ("0" + d.getMilliseconds()) : d.getMilliseconds());
		
		resultDateTime = resultDateTime.replace(new RegExp('yyyy', 'g'), yearRegExp);
		resultDateTime = resultDateTime.replace(new RegExp('yy', 'g'), String(yearRegExp).slice(-2));
		resultDateTime = resultDateTime.replace(new RegExp('MMMM', 'g'), lognMonthRegExp);
		resultDateTime = resultDateTime.replace(new RegExp('MM', 'g'), monthRegExp);
		resultDateTime = resultDateTime.replace(new RegExp('dddd', 'g'), daysLong[dayNameRegExp]);
		resultDateTime = resultDateTime.replace(new RegExp('ddd', 'g'), daysShort[dayNameRegExp]);
		resultDateTime = resultDateTime.replace(new RegExp('dd', 'g'), dayRegExp);
		resultDateTime = resultDateTime.replace(new RegExp('hh', 'g'), hoursRegExp);
		resultDateTime = resultDateTime.replace(new RegExp('mm', 'g'), minuteRegExp);
		resultDateTime = resultDateTime.replace(new RegExp('ss', 'g'), secondsRegExp);
		resultDateTime = resultDateTime.replace(new RegExp('zz', 'g'), milisecondsRegExp);
		
		return `${resultDateTime}`;
	},
	
	/* заменяет переносы строк указанным разделителем (по умолчанию '<br />') */
	replaceLineBreaks:(str, divider = `p`) => {
		
		if(!str) return '';
		
		var res = ``;
		
		switch(divider) {
			case 'br':
				divider = `<br>`;
				res = (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + divider + '$2');		
				break;
				
			case 'p':
				res = '<p>' + (str + '').replace(/\r?\n/g, '</p><p>') + '</p>';
				break;
		}


		res = res.replace(/<p><\/p>/g, '');
		return res;
	},
	
	/* обрезает строку до заданной длины, (по умолчанию - 100 знаков) */
	trimStr : (str, length) => {
		if(str == null) return false;
		length = length || 100;
		if (str.length > length) return str.substr(0, length - 1) + '...';
		return str;
		
	},
	
	/* рендеринг ejs-шаблона */
	renderEjsFile : (path, data) => {
		
		return new Promise((resolve, reject) => {
			
			ejs.renderFile(path, data, null, (err, str) => {
				if (err) {
					reject(err);
				}
				else {
					resolve(str);
				}
			});
			
		});
		
	}
	
}