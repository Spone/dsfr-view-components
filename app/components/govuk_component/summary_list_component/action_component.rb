class GovukComponent::SummaryListComponent::ActionComponent < GovukComponent::Base
  attr_reader :href, :text, :visually_hidden_text, :attributes, :classes

  def initialize(href: nil, text: 'Change', visually_hidden_text: nil, classes: [], html_attributes: {})
    super(classes: classes, html_attributes: html_attributes)

    @href                 = href
    @text                 = text
    @visually_hidden_text = visually_hidden_text
  end

  def render?
    href.present?
  end

  def call
    link_classes = govuk_link_classes.append(classes).flatten

    link_to(href, class: link_classes, **html_attributes) do
      safe_join([action_text, visually_hidden_span].compact, " ")
    end
  end

private

  def action_text
    content || text || fail(ArgumentError, "no text or content")
  end

  def visually_hidden_span
    tag.span(visually_hidden_text, class: "govuk-visually-hidden") if visually_hidden_text.present?
  end
end
