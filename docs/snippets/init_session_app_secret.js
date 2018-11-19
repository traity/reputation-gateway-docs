const jwt = require('jsonwebtoken')

const payload = { appId: process.env.APP_ID, callback_url: '<YOUR CALLBACK URL>' }
const token = jwt.sign(payload, process.env.APP_SECRET, { algorithm: 'HS512' })
