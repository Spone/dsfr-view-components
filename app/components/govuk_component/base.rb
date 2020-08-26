class GovukComponent::Base < ViewComponent::Base
  include GovukComponent::Traits::CustomClasses
  include GovukComponent::Traits::CustomHtmlAttributes

  def initialize(classes: [], html_attributes: {})
    @classes         = parse_classes(classes)
    @html_attributes = html_attributes
  end
end
