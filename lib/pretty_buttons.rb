module PrettyButtons
  
  ICON_FILES = Dir.glob(File.join("public/images/buttons/icons","*.png"))
  ICONS = ICON_FILES.map { |i| i.split("/").last }
  
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
  
  # dynamically Generate all icon based buttons
  ICONS.each do |icon|
    eval <<-ICN
      def #{icon.split(".").first}_button(content='',path='',options={})
        options[:class] = options[:class].nil? ? "button" : ("button " << options[:class])
        content = content_tag :span, content, :class => "icon"
        button_content = image_tag("buttons/icons/#{icon}") << content
        link_to button_content, path, options
      end
    ICN
  end
  
  # generates a pretty submit button inside a container
  # USAGE :
  # 
  #   pretty_submit "Sign Up!" # => generates a pretty submit button for the parent form
  # 
  # if you need to generate a submit button for a more complex form, here's an example:
  # 
  #   pretty_submit "Sign Up!", :form => "signup-form"
  # 
  # you can also pass a block if you want to put stuff inside the container
  # 
  #   pretty_submit "Sign Up!" do
  #     or <a href="history.go(-1)">cancel</a>
  #   end
  # 
  # OPTIONS:
  #   :div = div html attributes for the container, all html attributes are valid
  #   :btn = anchor attributes for the button, all html attributes are valid     
  #   :form = the id of the form you want to submit, use this on complex form layouts
  # 
  # NOTE : 
  #   this method uses javascript to submit the form, so this requires that you only
  #   nest the the submit button one element inside the the form, if you need this to 
  #   work for a more complex form where the submit button is nested more than one level
  #   deep then simply pass the id of the form to the :form option
  # 
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
  
  if RAILS_GEM_VERSION > '1.2.3'
    # Rails 1.2.3 doesn't do do aliases on dynamic methods
    alias :back_button :arrow_left_button
    alias :delete_button :cancel_button
    alias :destroy_button :cancel_button
    alias :edit_button :pencil_button

    # some convenient button macros
    alias :back_button :arrow_left_button
    alias :forward_button :arrow_right_button
    alias :refresh_button :arrow_refresh_button
    alias :up_button :arrow_up_button
    alias :down_button :arrow_down_button
    alias :print_button :printer_button
    alias :search_button :magnifier_button
  end
  
end
