require 'fileutils'

PUBLIC_CSS = File.join(RAILS_ROOT,"public","stylesheets")
PUBLIC_IMGS = File.join(RAILS_ROOT,"public","images")
PLUGIN_PATH = File.join(RAILS_ROOT, "vendor/plugins/pretty_buttons")

namespace :pretty_buttons do
  desc 'Installs all the files for the buttons'
  task :install do
    css_path = Dir.glob File.join(PLUGIN_PATH, "css", "*.css")
    imgs_path = Dir.glob File.join(PLUGIN_PATH, "images", "*.gif")
    
    btn_dir = Dir.mkdir File.join(PUBLIC_IMGS,"buttons")
    
    FileUtils.cp_r imgs_path, File.join(PUBLIC_IMGS, "buttons")
    FileUtils.cp_r css_path, PUBLIC_CSS
    
    puts "Pretty Buttons installed!"
    puts "--"
    puts "Just add <%= include_pretty_buttons %> in your layout file"
  end
end
