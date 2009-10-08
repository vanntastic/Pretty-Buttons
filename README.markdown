PrettyButtons
=============

Pretty Buttons is another button plugin that allows you to use pretty buttons like the ones shown by Oscar Alexander at : 

    http://www.oscaralexander.com/tutorials/how-to-make-sexy-buttons-with-css.html
    
    
Installation    
============

1. run:

     rake pretty_buttons:install
    
2. add this to your layout file

     <%= include_pretty_buttons %>
        
EXAMPLES
========
    
    # standard pretty button
    <%= pretty_button "Sign up!", signup_path %>
    
    # form submit button
    <%= pretty_submit "Create User" %>
    
    # icon based pretty buttons, just like the ones that github uses!
    <%= add_button "Add User", user_path %>
    
    # the buttons also match restful conventions as well
    <%= edit_button "Edit User", edit_user_path %>
    <%= destroy_button "Delete User", user_path, :method => :delete %>

    # run the following task to get a list of all icon based button methods
    # note that you will need the `less` command to run this task, sorry window people
    rake pretty_buttons:list
    
USAGE
=====

pretty_button "click me", path, options={}
------------------------------------------

The pretty_button method takes the same options as link_to

EXAMPLE:

    <%= pretty_button "Sign up!", signup_path %>


pretty_submit "submit", options={}, &blk
----------------------------------------

Creates a pretty submit button, note that this submits the form via javascript,
it will automatically submit the parent form that the button is contained in,
if you are using pretty_submit on a complex form layout, simply give the form
an id and pass in the :form option.

OPTIONS:

- :div = div html attributes for the container, all html attributes are valid
- :btn = anchor attributes for the button, all html attributes are valid
- :form = the id of the form that you want to submit, use this only if button is nested more than 2 levels deep

EXAMPLES:

     # simple submit pretty button
     <%= pretty_submit "Sign Up!" %>

     # submit pretty button inside a complex form layout
     <%= pretty_submit "Sign Up!", :form => "signup-form" %>

     # submit pretty button with content inside container
     <% pretty_submit "Sign Up!" do %>
        or <%= link_to "cancel", "javascript:history.go(-1)" %>
     <% end %>   
        
Copyright (c) 2009 Vann Ek, released under the MIT license
Original Concept by Oscar Alexander:

    http://www.oscaralexander.com/tutorials/how-to-make-sexy-buttons-with-css.html
    
Silk Icons from famfamfam:
    
    http://famfamfam.com/lab/icons/silk/
