# Snackpack

snackpack is a utility for downloading the [Ruby Tapas](http://rubytapas.com) episodes locally while
also making the episodes easier to consume.

## Usage

`  gem install snackpack`

First time running this gem will create your configuration file which stores where you want to store your local ruby tapas.  Make sure to not miss any slashes in your directory name. `example: /home/user/ruby-tapas/` Also the first run it will take a while as it downloads all the files

`  snackpack username password`

Browse to download directory load up the `snack_log.html` and start enjoying your tapas!

## Description

[Ruby Tapas](http://rubytapas.com) is a 3 times a week screencast service by [@avdi](https://twitter.com/avdi).
Avdi is completely awesome and his screencast is a no brainer.

The utility will grab all the episodes you are missing, while also injecting the
video into the html file using html5 video tags.
