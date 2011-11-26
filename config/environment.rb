# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Criart::Application.initialize!

Criart::Application.configure do
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :port           => '587',
    :domain         => ENV['GMAIL_SMTP_USER'],
    :user_name  => ENV['GMAIL_SMTP_USER'],
    :password  => ENV['GMAIL_SMTP_PASSWORD'],
    :authentication => :plain
  }
end

