require 'eth'
require 'jwt'


key       = Eth::Key.new(priv: ENV['ETH_PRIVATE_KEY'])
payload   = { address: key.address,
              callback_url: '<YOUR CALLBACK URL>' }
signature = key.personal_sign(payload.to_json)
token     = JWT.encode(payload.merge(signature: signature), nil, 'none')
