# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cheese_express_session',
  :secret      => '4c9475645720d51762f8ffaee91f3fa0a9298142cb6e9655a1e1114e79e67f1c3b28f41bdd3a1b34c01ff8a89f6f534fee5766222bc5767326c1d2a8d593fb64'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
