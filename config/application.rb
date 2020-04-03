require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyBlog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.action_mailer.raise_delivery_errors = true     #注意，在development.rb下需修改成true
    #添加如下几行代码
    config.action_mailer.default_url_options = { :host => "localhost:3000" } #提示中有提到需要配置，即执行rails g devise:install
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        :address => "smtp.qq.com",  #smtp.qq.com
        :port => 25,
        :domain => "qq.com",   #qq.com
        :authentication => :login,
        :user_name => "466887696@qq.com", #修改邮箱
        :password => "ly980216" #修改正确的密码
    }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
