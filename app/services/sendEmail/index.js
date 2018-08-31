const nodemailer = require('nodemailer');
const config = require('./config');

const siteName = '';

const mailOptions = {};

const transporter = nodemailer.createTransport(config);

const sendEmail = (mailOptions) => {

    return new Promise((resolve, reject) => {
        if (!!mailOptions.to === false) {
            return reject(new Error(``));
        }

        transporter.sendMail(mailOptions, function (error, info) {
            if (error) {
                return reject(error);
            } else {
                return resolve({ status: 'ok' });
            }
        });
    })
};

module.exports = transporter;