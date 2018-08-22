require ‘eth’

key = Eth::Key.new(priv: YOUR_PRIVATE_KEY)

JWT.encode({
  reader: key.address,
  widget: {
    name: 'Acme Co.',
    logo: 'https://s3.amazonaws.com/traity-web/assets/acme.jpg',
    callback_url: 'https://acme.com'
  },
}, nil, ‘none’)

#eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJyZWFkZXIiOiIweGU0YmIzRmI0NmU4Mjc1N2Y5RkM2MmMyMjZmYzE4ODJBMkIxMzhkMmUiLCJ3aWRnZXQiOnsibmFtZSI6IlNpbHBoIENvLiIsImxvZ28iOiJodHRwczovL3B1dS5zaC9BRXlCVy9jMTU0YjE2ZDQwLnBuZyIsImNhbGxiYWNrX3VybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20ifX0.

