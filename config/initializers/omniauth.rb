Rails.application.config.middleware.user OmniAuth::Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, Rails.application.credentials.github[:client_id], Rails.application.credentials.github[:client_secret]
  end
end