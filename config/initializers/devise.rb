Devise.setup do |config|
  # Load and configure the ORM. Supports :active_record (default) and :mongoid (bson_ext recommended) by default.
  require 'devise/orm/active_record'

  # Configure which authentication keys should be case-insensitive.
  config.case_insensitive_keys = [:email]

  # Configure which authentication keys should have whitespace stripped.
  config.strip_whitespace_keys = [:email]

  # Limiting the stretches to just one in testing will increase the performance of your test suite dramatically.
  config.stretches = Rails.env.test? ? 1 : 12

  # Invalidates all the remember me tokens when the user signs out.
  config.expire_all_remember_me_on_sign_out = true

  # Range for password length.
  config.password_length = 6..128

  # Email regex used to validate email formats.
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete

  # Add a new OmniAuth provider. Check the wiki for more information on setting up on your models and hooks.
  config.omniauth :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
end
