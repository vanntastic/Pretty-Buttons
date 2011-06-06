require 'fileutils'

PRETTY_PUBLIC_CSS = File.join(Rails.root,"public","stylesheets")
PRETTY_PUBLIC_IMGS = File.join(Rails.root,"public","images")
PRETTY_PLUGIN_PATH = File.join(Rails.root, "vendor/plugins/Pretty-Buttons")

namespace :pretty_buttons do
  desc 'Installs all the files for the buttons'
  task :install do
    css_path = Dir.glob File.join(PRETTY_PLUGIN_PATH, "css", "*.css")
    imgs_path = File.join(PRETTY_PLUGIN_PATH, "images", ".")
    
    new_img_path = File.join PRETTY_PUBLIC_IMGS,"buttons"
    btn_dir = Dir.mkdir new_img_path unless File.exists? new_img_path
    
    FileUtils.cp_r imgs_path, new_img_path
    FileUtils.cp_r css_path, PRETTY_PUBLIC_CSS
    
    puts "Pretty Buttons installed!"
    puts "--"
    puts "Just add <%= include_pretty_buttons %> in your layout file"
  end
  
  desc 'Lists the current buttons that you can use, outputs it with less viewer'
  task :list do
    icon_list = File.join(PRETTY_PUBLIC_IMGS,"buttons","icons")
    icons = Dir.glob File.join(icon_list, "*.png")
    icons.map! { |i| "#{i.split('/').last.split('.').first}_button" }
    icons = icons.join("\n")
    less icons
  end
  
  def less(content)
    system('echo "' << content << '"|less')
  end
end
