require 'active_support/concern'

module PublishesUpdatesToPusher
  extend ActiveSupport::Concern

  included do
    after_commit :notify_via_pusher, on: [:create, :update]

    def notify_via_pusher
      PusherUpdateWorker.new.perform(self.class.name, id)
    end
  end
end
