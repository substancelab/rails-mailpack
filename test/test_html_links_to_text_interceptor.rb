# frozen_string_literal: true

require "minitest/autorun"

require_relative "../lib/html_links_to_text_interceptor"

class HtmlLinksToTextInterceptorTest < Minitest::Test
  def test_it_explodes_links_into_a_textual_representation
    result = HtmlLinksToTextInterceptor.delivering_email(original_mail)
    assert_equal \
      "Look at this site: http://example.com",
      result.text_part.body.to_s
  end

  def test_it_does_not_touch_the_HTML_part
    result = HtmlLinksToTextInterceptor.delivering_email(original_mail)
    assert_equal \
      'Look at this <a href="http://example.com">site</a>',
      result.html_part.body.to_s
  end

  def test_it_does_not_fail_if_no_text_part
    mail = Mail.new do
      html_part do
        body "Bob says hi"
      end
    end
    # assert no error
    HtmlLinksToTextInterceptor.delivering_email(mail)
  end

  def test_it_does_nothing_if_not_multipart
    mail = Mail.new do
      body '<a href="http://example.com">Link</a>'
    end
    # assert no error
    result = HtmlLinksToTextInterceptor.delivering_email(mail)
    assert_equal \
      '<a href="http://example.com">Link</a>',
      result.body.to_s
  end

  def test_it_works_with_old_school_HTML
    mail = build_mail("Look, <A HREF=http://example.com>a link")
    result = HtmlLinksToTextInterceptor.delivering_email(mail)
    assert_equal \
      "Look, a link: http://example.com",
      result.text_part.body.to_s
  end

  private

  def build_mail(body_text)
    Mail.new do
      text_part { body(body_text) }
      html_part { body(body_text) }
    end
  end

  def original_mail
    build_mail('Look at this <a href="http://example.com">site</a>')
  end
end
