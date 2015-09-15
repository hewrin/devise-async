module Devise
  module Async
    module Backend
      class Sidekiq < Base
        include ::Sidekiq::Worker

        sidekiq_options :queue => Devise::Async.queue
        def self.enqueue(*args)
          puts  "%%%%%%%%%%%%%%%%"
          perform_async(*args)
          puts "Job enqueued"
        end
      end
    end
  end
end
