module PrettyButtons
  
  def include_pretty_buttons
    stylesheet_link_tag 'buttons'
  end
  
  
  # generates a pretty button
  # USAGE : 
  #   pretty_button 'Click me', signup_url
  def pretty_button(content, path, options={})
    options[:class] = options[:class].nil? ? "button" : "button " << options[:class]
    link_to "<span>#{content}</span>", path, options
  end
  
  # generates a pretty submit button
  # USAGE :
  #   pretty_submit "Sign Up!"
  def pretty_submit(content, options={})
    options[:id] ||= "#{rand(9999)}-submit"
    options[:onclick] ||= "document.getElementById(this.id).parentNode.submit();"
    options[:class] = options[:class].nil? ? "button" : "button " << options[:class]
    link_to "<span>#{content}</span>", '#', options
  end
  
end
