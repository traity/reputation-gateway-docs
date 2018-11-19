Reading the TrustScore
======================

When users finish the process in Traity, they will redirected to the url you specified in the ``callback_url``
parameter during the widget session’s link initialization. A ``GET`` call will be made to that url
and it will include a parameter called ``request`` that will be needed to read user’s TraityScore from your site. \

There are two approaches to read a user's score. One is using the secret you got while creating your app in our Developers' dashboard
and second one is to use the decentralized option, where you can use your own blockchain keys to sign the request and get access to the user's score.
In both cases, a bearer token will be generated and you will be to read the users score by making a `GET` http request to the following URI:

:guilabel:`https://rg.traity.com/score`

**a) Using your application secret:**

If you are using your app secret, you just need to generate a new JWT token signed with it.
This new token should contain the payload you just received and should be included inside the ``Authorization`` header as a bearer token as follows:

.. tabs::
  .. tab:: Ruby

    .. literalinclude:: ../snippets/read_score_app_secret.rb
      :language: ruby

  .. tab:: Node.js

    .. literalinclude:: ../snippets/read_score_app_secret.rb


**b) Using your Blockchain key:**

If you want to use your own blockchain keys, the authorization token needed to get access to the user's score is generated as follows:

- Decode the received the payload and sign the ``hash`` claim with your own private key.
- Encode this payload including the ``signature`` claim with the signature you just generated into a new JWT token.

With this new bearer token you will be authorized to read the user's TrustScore:

.. tabs::
  .. tab:: Ruby

    .. literalinclude:: ../snippets/read_score_eth_key.rb
      :language: ruby

  .. tab:: Node.js

    .. literalinclude:: ../snippets/read_score_eth_key.js


Successful requests made to the score endpoint will return responses similar to this:

.. literalinclude:: ../snippets/score.json

.. warning::
  User's permission will last 24 hours starting at the moment the process of building the TrustScore is completed.
  An error will be raised if score is tried to be accessed with the same token after that period of time.

.. seealso::
  Reputation Gateway is based on `REY <https://reputation.network>`_, the decentralized risk scoring protocol.
  More information about the permission JWT token and its different claims
  can be found at https://rey.readthedocs.io/en/latest/contents/reference.html

Interpreting the TrustScore
===========================

| The returned response for a score will have two fields.
 `score` which is the global value to indicate the user's trustworthiness,
 and `breakdown`, which includes the different components of the global score which are **identity**, **behavioural_reputation** and **network**.
| Each score will go from 0 to 100.

| **identity** tells how close are the users of being who they say they are, preventing the use of stolen or very recent accounts.


| **behavioural_reputation** tells about users' reputation in sites such as Airbnb or Ebay.
| Having a record of positive transactions in other sites is a good indicator of how will this person behave in a new site with no previous history.

| **network** gives a sense of how trustworthy users' connections are.
| Having a network of trustworthy people is an indicator of accountability.

| You are free to define what you consider a good score to your business or if you want to use any of the breakdown scores.
| From our experience, a TrustScore of at least 70 points is a good starting point to differentiate the most trustworthy users.
| Bear in mind that having a low TrustScore doesn't necessary mean the user can't be trusted. It usually means not enough information
  was provided to make an assesment.


