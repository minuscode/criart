=begin
Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  #provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :facebook, '142421889194347', '7353f69e5058656690c61f2f16a778fe'
end
=end