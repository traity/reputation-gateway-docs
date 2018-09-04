require 'jwt'

authorization = JWT.encode({ request: params[:request] }, ENV['APP_SECRET'], 'HS512')
response      = Faraday.get('https://rg.traity.com/score',
                            nil,
                            'Authorization': "Bearer #{authorization}").body
score         = JSON.parse(response)
