# Mailpack
## Send simple, maintainable, and compatible emails in Rails

Rails makes sending out multipart emails deceptively easy. Just throw two appropriately named templates in your mailers view-directory, and ActionMailer takes care of everything for you.

But email is never as easy it seems. These are a few battle-tested tricks we have learned that makes emails manageable.

## With Mailpack you get to

* Write emails in Markdown
* Use layouts for emails
* Include images in your emails without worry
* Use Sass and CSS to style emails

## What's included in the box

Mailpack is a meta-package of existing gems:

* premailer-rails
* markerb

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails-mailpack'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-mailpack

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/substancelab/rails-mailpack/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
