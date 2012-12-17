Landlorder
----------

A small and buggy web client in Ruby on Rails / Postgresql / Twitter Bootstrap for the game [Landlord][2]

Easy to deploy on Heroku.
The app uses Foursquare connect.
Set api key and secret in config/initializers/foursquare.rb (copy config/initializers/foursquare.rb.model)

What you can do :

- explore venues price at a distance (from you browser)
- buy venues wherever you are :-) this is a called cheating !
- get a snapshot of your all properties in a sortable table
- more...

Once connected with Foursquare, you will need to find a way to get your Landlord userId and auth token...
Use a proxy like Charles or any other way to sniff the http requests headers going in and out of your iphone.

[Example here][3]

Developped by [iesta][1]

[1]: http://twitter.com/sucrenoir        "Twitter"
[2]: http://www.landlordgame.com    "Landlord"
[3]: http://landlorder.herokuapp.com    "Landlorder"

![Screenshot](https://dl.dropbox.com/u/2188772/Capture%20d%E2%80%99%C3%A9cran%202012-12-17%20%C3%A0%2017.37.55.png)