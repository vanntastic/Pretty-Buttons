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
