require 'email_processor'

Griddler.configure do |config|
  config.email_service = :mandrill
end
