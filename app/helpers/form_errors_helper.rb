module FormErrorsHelper
  attr_reader :template
  attr_reader :object

  def error_span(attribute, options = {})
    options[:class] ||= 'help-inline'

    template.content_tag(
      :span, errors_for(attribute),
      class: options[:class]
    ) if errors_on?(attribute)
  end

  def errors_on?(attribute)
    object.errors[attribute].present? if object.respond_to?(:errors)
  end

  def errors_for(attribute)
    object.errors[attribute].try(:join, ', ')
  end
end
