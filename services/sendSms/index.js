const smscPackage = require('node-smsc');

const smsc = smscPackage({
    login: 'sandalb',
    password: '5d93ceb70e2bf5daa84ec3d0cd2c731a', // password is md5-hashed implicitly unless "hashed" option is passed.
    hashed: true
})

module.exports = smsc;