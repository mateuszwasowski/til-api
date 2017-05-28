class PusherUpdateWorker
  include Sidekiq::Worker

  def perform(klass, id)
     obj = Object.const_get(klass).find(id)
     channel_id = Rails.application.secrets.pusher["channel"]

     serialized = ActiveModelSerializers::SerializableResource.new(Til.all).as_json

     Pusher.trigger(channel_id, "objectsUpdated", serialized)
  end
end
