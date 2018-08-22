require 'eth'
require 'jwt'
require 'faraday'
require 'json'

key        = Eth::Key.new(priv: YOUR_PRIVATE_KEY)
token      = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJub25...iIiwiMHgxYyJdXX0.' # the permission token you received in params[:permission]
permission = JWT.decode(token, TRAITY_PUBLIC_KEY, true)[0]

permission[:signature] = Eth::Utils.bin_to_prefixed_hex(private_key.sign(Eth::Utils.hex_to_bin(permission['hash'])))

request   = JWT.encode(permission, nil, 'none')
response  = Faraday.get('https://reputation.traity.com', nil, 'Authorization': "Bearer #").body
score     = JSON.parse(response)
