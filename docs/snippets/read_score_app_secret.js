const axios = require('axios')
const jwt = require('jsonwebtoken')

const credentials = jwt.sign({ request: req.query.request }, process.env.APP_SECRET, {
  algorithm: 'HS512'
})
const scoreApiRes = await axios.get('https://rg.traity.com/score', {
  headers: { authorization: `Bearer ${credentials}` }
})
const score = scoreApiRes.data
