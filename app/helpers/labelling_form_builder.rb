
class LabellingFormBuilder < ActionView::Helpers::FormBuilder
  # def span(attribute, options={})
  #   # label(attribute)
  #   @template.content_tag(:span, attribute)
  # end

  # def span(method, text = nil, options = {}, &block)
  #   @template.content_tag(:span, I18n.t(method, scope: [:activerecord, :attributes, @object_name]))
  #   # foo = I18n.t method, scope: [:activerecord, :attributes, @object_name]
  #   # @template.span(@object_name, method, text, objectify_options(options), &block)
  # end

  def span(attribute, options = {})
    @template.content_tag(:span, I18n.t(attribute, scope: [:activerecord, :attributes, @object_name], default: attribute.to_s), options)
  end
end