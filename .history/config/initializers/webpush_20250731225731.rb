# config/initializers/webpush.rb

vapid_public_key = ENV['VAPID_PUBLIC_KEY']
vapid_private_key = ENV['VAPID_PRIVATE_KEY']

if vapid_public_key.nil? || vapid_private_key.nil?
  raise "VAPID keys are missing. Please set ENV['VAPID_PUBLIC_KEY'] and ENV['VAPID_PRIVATE_KEY']"
end

Rails.application.config.x.webpush.vapid_public_key = vapid_public_key
Rails.application.config.x.webpush.vapid_private_key = vapid_private_key
Rails.application.config.x.webpush.vapid_subject = 'mailto:you@example.com'
