require 'fileutils'

PRETTY_PUBLIC_CSS = File.join(RAILS_ROOT,"public","stylesheets")
PRETTY_PUBLIC_IMGS = File.join(RAILS_ROOT,"public","images")
PRETTY_PLUGIN_PATH = File.join(RAILS_ROOT, "vendor/plugins/Pretty-Buttons")

namespace :pretty_buttons do
  desc 'Installs all the files for the buttons'
  task :install do
    css_path = Dir.glob File.join(PRETTY_PLUGIN_PATH, "css", "*.css")
    imgs_path = Dir.glob File.join(PRETTY_PLUGIN_PATH, "images", "*.gif")
    
    new_img_path = File.join PRETTY_PUBLIC_IMGS,"buttons"
    btn_dir = Dir.mkdir new_img_path unless File.exists? new_img_path
    
    FileUtils.cp_r imgs_path, new_img_path
    FileUtils.cp_r css_path, PRETTY_PUBLIC_CSS
    
    puts "Pretty Buttons installed!"
    puts "--"
    puts "Just add <%= include_pretty_buttons %> in your layout file"
  end
end
