# frozen_string_literal: true

require "html_links_to_text_interceptor"
require "markerb"
require "premailer/rails"

# Convert html links to text links
ActionMailer::Base.register_interceptor HtmlLinksToTextInterceptor
ActionMailer::Base.register_preview_interceptor HtmlLinksToTextInterceptor
