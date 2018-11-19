const axios = require('axios')
const jwt = require('jsonwebtoken')
const Accounts = require('web3-eth-accounts')

const account = (new Accounts()).privateKeyToAccount(process.env.ETH_PRIVATE_KEY)
const { request } = jwt.decode(req.query.request)
const signature = account.sign(request.hash)
const credentials = jwt.sign({ ...request, signature }, null, { algorithm: 'none' })
const scoreApiRes = await axios.get('https://rg.traity.com/score', {
  headers: { authorization: `Bearer ${credentials}` }
})
const score = scoreApiRes.data

