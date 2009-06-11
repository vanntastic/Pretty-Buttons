module PrettyButtons
  
  def include_pretty_buttons
    stylesheet_link_tag 'buttons'
  end
  
  
  def pretty_button(content, path, options={})
    options[:class] = options[:class].nil? ? "button" : "button " << options[:class]
    link_to "<span>#{content}</span>", path, options
  end
  
end
