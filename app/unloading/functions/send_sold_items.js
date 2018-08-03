const sendPost = require('./send_post');

module.exports = async (data) => {
	// если пустой массив с позициями, ничего не делать
	if (data.poses.length < 1) return false;
	var sendItemsResult = await sendPost(`http://25.27.135.50:80/shop_api/`, { data: JSON.stringify(data), path: 'sales_export', func: 'sales_export' });

	console.log(sendItemsResult);
};