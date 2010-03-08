RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'compass', :version => '>= 0.8.17'
  config.gem 'haml', :version => '>=2.2.16'
  config.gem "clearance"
  config.time_zone = 'UTC'
end


ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "gmail.com",
    :authentication => :plain,
    :user_name => "santabarbara.railsgroup",
    :password => "rUb!ypR0G8rm"
  }

