# Snackpack

snackpack is a utility for downloading the [Ruby Tapas](http://rubytapas.com) episodes locally while
also making the episodes easier to consume.

## Usage

  gem install snackpack

  mkdir /path/to/where/you/want/to/store/tapas/

Copy and edit the snackpack.yml move it into your tapas dir

  cd /path/where/you/are/storing/tapas/
  
First time running this gem will take a while as it downloads all the files

  snackpack username password

## Description

[Ruby Tapas](http://rubytapas.com) is a 3 times a week screencast service by [@avdi](https://twitter.com/avdi).
Avdi is completely awesome and his screencast is a no brainer.

The utility will grab all the episodes you are missing, while also injecting the
video into the html file using html5 video tags.
