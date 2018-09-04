require 'jwt'

token = JWT.encode({ appId: ENV['APP_ID'],
                     callback_url: '<YOUR CALLBACK URL>' },
                     ENV['APP_SECRET'], 'HS512')

