# frozen_string_literal: true

require "loofah"
require "mail"

# An ActionMailer interceptor that converts HTML links to a text-representation
# in the text/plain part of emails.
class HtmlLinksToTextInterceptor
  # A specialized Scrubber to convert HTML links to text
  class LinkScrubber < Loofah::Scrubber
    def scrub(node)
      replace_link_node_with_text_node(node) if link?(node)
    end

    private

    def build_text_node_from_link(node)
      link_text_node = node.children.first
      link_text_node.content = "#{link_text_node}: #{extract_url(node)}"
      link_text_node
    end

    def extract_url(node)
      href = node.attributes["href"]
      return nil unless href
      href.value
    end

    def link?(node)
      node.name == "a"
    end

    def replace_link_node_with_text_node(node)
      link_as_text = build_text_node_from_link(node)
      node.before link_as_text
      node.remove
    end
  end

  def self.delivering_email(message)
    return message unless message.text_part

    text_body = message.text_part.body
    message.text_part.body = scrub_body(text_body).to_s
    message
  end

  def self.previewing_email(message)
    delivering_email(message)
  end

  def self.scrub_body(body)
    Loofah.fragment(body.to_s).scrub!(LinkScrubber.new)
  end
end
