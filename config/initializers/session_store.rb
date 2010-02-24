# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sbonrails_session',
  :secret      => '2864ef329581ba74fa3eb76fa42f608d8bcb08856d73c8a096f39c1772ab4626a853fa446a3d1744078a87b40dee8be5ba2fe74d526df08e115bd8f1c464b4e3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
