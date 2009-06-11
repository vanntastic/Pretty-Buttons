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
    
Usage
=====

pretty_button "click me", path, options={}
------------------------------------------

The pretty_button method takes the same options as link_to

Example
-------

    <%= pretty_button "Sign up!", signup_path %>
    

Copyright (c) 2009 Vann Ek, released under the MIT license
Original Concept by Oscar Alexander:

    http://www.oscaralexander.com/tutorials/how-to-make-sexy-buttons-with-css.html