# config/initializers/active_storage.rb
Rails.application.config.active_storage.routes_prefix = '/rails/active_storage'

Rails.application.config.active_storage.resolve_model_to_route = :rails_storage_proxy

Rails.application.routes.default_url_options[:host] = 'localhost:3000' # Adjust this to your application's host
