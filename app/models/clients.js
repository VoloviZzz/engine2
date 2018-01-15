exports.clientsList = async function() {
	return [err, rows] = await getRows("SELECT * FROM clients")
}