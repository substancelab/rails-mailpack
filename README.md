# Mailpack
## Send simple, maintainable, and compatible emails in Rails

Rails makes sending out multipart emails deceptively easy. Just throw two appropriately named templates in your mailers view-directory, and ActionMailer takes care of everything for you.

But email is never as easy it seems. These are a few battle-tested tricks we have learned that makes emails manageable.

## With Mailpack you get to

* Write emails in Markdown
* Use layouts for emails
* Include images in your emails without worry
* Use Sass and CSS to style emails

## Usage

To build both plain text and HTML versions of your email:

    class HelloMailer < ApplicationMailer
      def greeting
        @name = "Bob"
        mail(:to => "noone@example.com") do |format|
          format.text
          format.html
        end
      end
    end

The template supports Markdown and ERB:

    # Hi <%= @name %>
    
    * This is a list
    * ... with multiple items

We've included two sample layout files; one for HTML mails and one for plain text. They're in `lib/templates/application_mailer.*.erb`.

They support the following content blocks:

* `call_to_action`: Use this to output a big button with a link below the primary content of the email.
* `below_call_to_action`: Use this to insert extra content below the call to action. Usually less important stuff, like legal rambles or explanations of the preceding content.

To style your email create an `app/assets/stylesheets/application_mailer.sass` (or however you prefer styling). Include the file into your email HTML layout:

    <%= stylesheet_link_tag "application_mailer" %>

This causes the styles from the stylesheet to be inserted as inline styles in the rendered email.

We've included a sample stylesheet in `lib/templates/application_mailer.sass`, based on tested and hardened styles built by [Litmus](https://litmus.com/resources/free-responsive-email-templates).

## What's included in the box

Mailpack stands on the shoulders of giants:

* [premailer](https://github.com/premailer/premailer) via [premailer-rails](https://github.com/fphilipe/premailer-rails)
* [Markerb](https://github.com/plataformatec/markerb)

### Markerb

> Markerb allows you to render multipart e-mails from a single template. The template is written in Markdown, which is delivered as a text part, but also rendered and delivered as an HTML part.

### Premailer

* CSS styles are converted to inline style attributes
* Relative paths are converted to absolute paths
* CSS properties are checked against e-mail client capabilities
* A plain text version is created (optional)

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rails-mailpack", :require => false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails-mailpack

### To convert HTML links to a pretty text version

Add an initializer:

    require "rails/mailpack/all"
    ActionMailer::Base.register_interceptor HtmlLinksToTextInterceptor
    ActionMailer::Base.register_preview_interceptor HtmlLinksToTextInterceptor

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/substancelab/rails-mailpack/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
