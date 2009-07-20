module PrettyButtons
  
  # gives you the stylesheet link for the buttons
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
  
  # generates a pretty submit button inside a container
  # USAGE :
  #   pretty_submit "Sign Up!" # => generates a pretty submit button for the parent form
  # 
  # if you need to generate a submit button for a more complex form, here's an example:
  #   pretty_submit "Sign Up!", :form => "signup-form"
  # 
  # NOTE : 
  #   this method uses javascript to submit the form, so this requires that you only
  #   nest the the submit button one element inside the the form, if you need this to 
  #   work for a more complex form where the submit button is nested more than one level
  #   deep then simply pass the id of the form to the :form option
  
  def pretty_submit(content, options={}, &blk)
    default_form = "document.getElementById(this.id).parentNode.parentNode"
    options[:form] ||= default_form
    form = options[:form] == default_form ? default_form : "document.getElementById('#{options[:form]}')"
    
    options[:btn] ||= {}
    options[:btn][:id] ||= "submit-#{rand(9999)}"
    options[:btn][:class] = options[:btn][:class].nil? ? "button" : ("button " << options[:btn][:class])
    options[:btn][:onclick] = "#{form}.submit();"
    
    options[:div] ||= {}
    options[:div][:class] = options[:div][:class].nil? ? "clear submit-line" : ("clear submit-line " << options[:div][:class])
    
    options.delete :form
    btn = link_to("<span>#{content}</span>", '#', options[:btn])
    if block_given?
      concat content_tag(:div, "#{btn}#{capture(&blk)}", options[:div]), blk.binding
	  else
	    content_tag :div, btn, options[:div]
    end
  end
  
end
