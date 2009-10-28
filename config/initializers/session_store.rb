# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hecho_session',
  :secret      => '6ceb7d74aee77bc1936e07a9459321ba5eec7691994bd2f26bc5187c7051ba758449ab9b11492b36354c684c7fa2f6663d06a5752d0108891d3a01896fc23794'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
