const jwt = require('jsonwebtoken')
const Accounts = require('web3-eth-accounts')

const account = (new Accounts()).privateKeyToAccount(process.env.ETH_PRIVATE_KEY)
const payload = { address: account.address, callback_url: '<YOUR CALLBACK URL>' }
const signature = account.sign(JSON.stringify(payload))
const token = jwt.sign({ ...payload, signature }, null, { algorithm: 'none' })
