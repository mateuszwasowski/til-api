class PusherUpdateWorkerWorker
  include Sidekiq::Worker

  def perform(klass, id)
     obj = Object.const_get(klass).find(id)
     channel_id = Rails.application.secrets.pusher.channel_id

     resource_klass = Object.const_get("#{klass}Resource")

     serialized = JSONAPI::ResourceSerializer.new(resource_klass, {
       always_include_to_one_linkage_data: true,
       always_include_to_many_linkage_data: true
     }).serialize_to_hash(resource_klass.new(obj, nil))

     Pusher.trigger(channel_id, "objectUpdated", serialized)
  end
end
