class WelcomeController < ApplicationController
  def index
  end
=begin
  def index
    line = "### Integra Engine Gems ###"
    gsub_file 'Gemfile', /(#{Regexp.escape(line)})/mi do |match|
      "#{match}\nhas_many :tags\n"
    end    
  end
  
  def gsub_file(relative_destination, regexp, *args, &block)
    path = File.join(Rails.root, relative_destination)
    content = File.read(path).gsub(regexp, *args, &block)
    File.open(path, 'wb') { |file| file.write(content) }
  end
=end  

  
end
