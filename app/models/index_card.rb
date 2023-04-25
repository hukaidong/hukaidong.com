# frozen_string_literal: true

class IndexCard
  def initialize(card, namespace)
    @namespace = namespace
    @title, @content = card
  end

  def title
    "#{@namespace.capitalize} #{@title.capitalize}"
  end

  def plain_content
    @plain_content ||= \
      begin
                               lines = @content['plain-content'].lines
                               lines.map! { |x| x.split(':').first }
                               lines.map!(&:strip)
                               lines.reject!(&:empty?)
                               lines.join("\n")
                             end
  end

  def content
    plain_content
  end

  def inspect
    { title: title, content: content }.inspect
  end
end
