![kohaku banner](http://a.pomf.se/vxtswv.png)

An automated image tagging program written in Ruby using the Imagga API: (https://imagga.com)

## requirements

* Ruby 2.x or higher
* an Imagga (https://imagga.com) account

## usage

1. clone this repo / download the .zip
2. open your preferred terminal emulator in the `kohaku` directory
3. type `ruby kohaku.rb`

## TODO:

* create a better readme
* comments
* support for multiple file formats
* rspec tests / general error handling
* gemify
* allow user to specify how many tags to use when renaming
* directory checking to make sure user doesn't rename images in accidentally incorrect directory
* multiple modes for more precise image tagging, e.g. 'wallpaper' mode will always include 'wallpaper' for one of the tags applied to images in a directory
* maybe combine with cloudsight api?
