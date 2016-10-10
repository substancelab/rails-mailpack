# frozen_string_literal: true

$:.push File.expand_path("..", __FILE__)

require "rails/mailpack/version"

autoload :HtmlLinksToTextInterceptor, 'html_links_to_text_interceptor'

module Rails
  module Mailpack
  end
end
