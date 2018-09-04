Reputation Gateway Documentation
================================

Documentation files for the [Reputation Gateway](https://traity.com/scoring). Browsable at [reputation-gateway.rtfd.io](https://reputation-gateway.rtfd.io).

Installation
------------

To install dependencies:

    pip install --user -r requirements.txt

Viewing
-------

To build the documentation to browse it locally:

```
sphinx-autobuild -H 0.0.0.0 -p 8080 . _build/html
```

Then just open `http://127.0.0.1:8080`.

Deploying
---------

To deploy, simply push to master:

    git push origin master
