require 'eth'
require 'jwt'
require 'faraday'

key                  = Eth::Key.new(priv: ENV['ETH_PRIVATE_KEY'])
request              = JWT.decode(params[:request], nil, false).first['request']
request['signature'] = Eth::Utils.prefix_hex(key.personal_sign(Eth::Utils.hex_to_bin(request['hash'])))
authorization        = JWT.encode({ request: request }, nil, 'none')

response             = Faraday.get('https://rg.traity.com/score', nil, 'Authorization': "Bearer #{authorization}").body
score                = JSON.parse(response)
