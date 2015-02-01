# Rack::Deflatermaus

A drop-in replacement for [`Rack::Deflater`] that plays a selection from the
operetta *[Die Fledermaus][wiki]* on your server before every request.

This may slow down your application significantly.

[`Rack::Deflater`]: http://robots.thoughtbot.com/content-compression-with-rack-deflater
[wiki]: https://en.wikipedia.org/wiki/Die_Fledermaus

## Installation

`Rack::Deflatermaus` uses the [audite] gem, which requires portaudio and mpg123.
Refer to audite's [installation instructions][audite-libs] to find out how to
install those on your system.

[audite]: https://github.com/georgi/audite
[audite-libs]: https://github.com/georgi/audite#requirements

Add this line to your application's Gemfile:

```ruby
gem "rack-deflatermaus"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-deflatermaus

## Usage

`Rack::Deflatermaus` is a drop-in replacement for [`Rack::Deflater`]. You can
use it anywhere you'd use `Rack::Deflater`.

In Rails:

```ruby
# config/application.rb, or
# config/environments/development.rb if you lack conviction

config.middleware.use Rack::Deflatermaus
```

In any Rack application:

```ruby
# config.ru
use Rack::Deflatermaus
```

Restart your application and load a page, any page.

## I want to use this with Rack::Timeout, how long does the music play for?

First: you might want to figure out why you're using this with an app that is
also tracking how long requests take. I find writing down a pro/con list
personally helpful, but you do you.

Done? Great.

It plays five minutes of Die Fledermaus, and you should probably...not use
Rack::Timeout with this.

## Contributing

1. Fork it: https://github.com/gabebw/rack-deflatermaus/fork
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Create a new Pull Request
