#Be sure to restart your server when you modify this file.
# Define an application-wide HTTP permissions policy. For further
+ # information see https://developers.google.com/web/updates/2018/06/feature-policy
-
+ #
- # Rails.application.config.permissions_policy do |policy|
+ # Rails.application.config.permissions_policy do |f|
- #   policy.camera      :none
+ #   f.camera      :none
- #   policy.gyroscope   :none
+ #   f.gyroscope   :none
- #   policy.microphone  :none
+ #   f.microphone  :none
- #   policy.usb         :none
+ #   f.usb         :none
- #   policy.fullscreen  :self
+ #   f.fullscreen  :self
- #   policy.payment     :self, "https://secure.example.com"
+ #   f.payment     :self, "https://secure.example.com"
 # end
