Getting started
===============

An account at https://developers.traity.com is required to start using the Reputation Gateway. If you already have an account in traity.com,
you can use the same credentials.

Traity's Reputation Gateway relies on `REY <https://reputation.network>`_, a decentralized infrastructure for risk scoring based
on Ethereum’s blockchain, so during the app creation process you will be asked wether you want to use your own blockchain keys or
let have Traity generate a new one and manage it in your behalf.

In case you want to use your own blockchain key, you will be asked to provide your key's public address in order to identify
you when you sign the necessary payloads to communicate with the ReputationGateway.


You can also have your private key generated and managed by Traity.
In that case, you will authenticate into our API using the provided ``app id`` and ``app secret``.

Adding the ReputationGateway to your flow is as easy as redirecting your users to Traity’s onboarding so they can start building their TrustScore.
Users should be redirected to the following URL and include a session token.

:guilabel:`https://rg.traity.com/w/<SESSION-TOKEN>`

The session parameter is a JWT token that contains the necessary information to identify you.
It will also indicate where should users be redirected once they finish the process on Traity, which means it should be a
URL of an application of your own where you will have control to read the user's TrustScore.

The session token can be generated as follows:

**a) Using your application secret:**

.. tabs::
  .. tab:: Ruby

    .. literalinclude:: ../snippets/init_session_app_secret.rb




**b) Using your Blockchain key:**

.. tabs::
  .. tab:: Ruby

    .. literalinclude:: ../snippets/init_session_eth_key.rb


.. The session parameter is a JWT token that contains the necessary information to identify you.
.. It will also indicate where should users be redirected once they finish the process on Traity.
..
.. The JWT token is generated from a payload with the following claims:
..
.. ======  ====
.. ======  ====
.. reader  The public address derived from your private key
.. widget  Hash that contains information about your service,
..         including the call back url where users will be redirected.
.. ======  ====
..
.. The widget object will require the following fields:
..
.. ============  ===
.. ============  ===
.. name          Your company’s name as it will be displayed during the process in Traity
.. logo          Url of your company’s logo to be displayed during the process in Traity
.. callback_url  Url where users will be redirect after finishing the process in Traity
.. ============  ===
..
.. .. tabs::
..   .. tab:: Ruby
..
..     .. literalinclude:: ../snippets/init_session.rb


Having that token, now you can add the link into your website. You can customize it as much as you want.

.. code:: html

  <a href="https://rg.traity.com/w/eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJyZWFkZXIiOiIweGU0YmIzRmI0NmU4Mjc1N2Y5RkM2MmMyMjZmYzE4ODJBMkIxMzhkMmUiLCJ3aWRnZXQiOnsibmFtZSI6IlNpbHBoIENvLiIsImxvZ28iOiJodHRwczovL3B1dS5zaC9BRXlCVy9jMTU0YjE2ZDQwLnBuZyIsImNhbGxiYWNrX3VybCI6Imh0dHBzOi8vZXhhbXBsZS5jb20ifX0.">Connect your Online Reputation wit Traity</a>

Now, you just to have to decide in which part of your application’s flow you do you want to include our service. Each business is be different and has its own needs so there might be multiple scenarios to consider:

For example, a user has followed the traditional flow within your app and according to your current scoring system, that person is not eligible for your product. So, you might want to offer them the possibility of using their TrustScore as a complementary data point, increasing your potential customer base from those that were initially rejected.

Also, you could completely substitute your current data collection flow, which might require some sort of manual review, and replace it with our process to have a reliable score that allows you to make decisions in real time.


.. figure:: ../img/rg-flow-2.png

  Re-engaging with initially rejected customers

.. figure:: ../img/rg-flow-1.png

  Using Traity as the main scoring system
