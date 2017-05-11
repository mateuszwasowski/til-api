require 'pusher'

Pusher.app_id = Rails.application.secrets.pusher["app_id"]
Pusher.key = Rails.application.secrets.pusher["key"]
Pusher.secret = Rails.application.secrets.pusher["secret"]
Pusher.cluster = 'eu'
Pusher.logger = Rails.logger
Pusher.encrypted = true
