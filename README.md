![kohaku banner](http://a.pomf.se/vxtswv.png)

An automated image tagging program written in Ruby using the Imagga API: (https://imagga.com)

Kohaku is primarily targeted towards individuals who store a lot of pictures locally, such as imageboard users. It works best with large, non-vector images - particularly of landscapes and people.

Expect Kohaku to get angry at you for strange inputs. Error handling/checking has yet to be extensively implemented.

## requirements

* Ruby 2.x or higher
* an Imagga (https://imagga.com) account

## usage

1. clone this repo / download the .zip
2. open your preferred terminal emulator in the `kohaku` directory
3. type `ruby kohaku.rb`

**NOTE:** Please give Kohaku a directory of only .jpg images for now - more testing has yet to be completed with other formats.

## current limitations

### fixable limitations
* only works with .jpg files, other formats will be included **very** soon

### unfixable (imagga) limitations
* close-ups of objects where only part of the object can be seen tends to produce odd tags
* .gifs don't work! this is a limitation on imagga's end, but still good to note

## TODO:

* **update to work with clarifai.com**
* create a better readme
* comments
* support for multiple file formats
* rspec tests / general error handling
* gemify
* allow user to specify how many tags to use when renaming
* directory checking to make sure user doesn't rename images in accidentally incorrect directory
* multiple modes for more precise image tagging, e.g. 'wallpaper' mode will always include 'wallpaper' for one of the tags applied to images in a directory
* maybe combine with cloudsight api?
