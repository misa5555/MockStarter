require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module BigStart
  class Application < Rails::Application
    config.categories = ["Art", "Crafts", "Dance", "Design", "Fashion", "Film", "Food", "Games", "Journalism", "Music", "Photography", "Publishing", "Technology", "Theater"]
    config.assets.paths << "#{Rails}/vendor/assets/fonts"
    
    config.paperclip_defaults = {                                   
      :storage => :s3,                                              
      :s3_protocol => 'http',                                       
      :url =>':s3_domain_url',                                      
      :path => "images/:class/:id.:style.:extension",
      :s3_host_name => 's3-us-west-1.amazonaws.com',
      :s3_credentials => {                                          
        :bucket => ENV['AWS_BUCKET'], 
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],                 
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']          
      }                                                             
    }         
  end
end
