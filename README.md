#RoundingThird
=============

An app to help baseball fans plan their next road trip.

##Installation

Clone from github:

`git clone https://github.com/ccampb13/rounding_third.git`

Create the `database.yml` and `oauth.yml` files

  * Example files can be found in the <tt>config</tt> directory
  * You must create facebook app and obtain the API keys from there

Install your bundle

`bundle install`

Configure the development database

`rake db:create`
`rake db:migrate`

Run the server

`rails server`
