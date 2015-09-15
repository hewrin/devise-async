module Devise
  module Async
    module Backend
      class Sidekiq < Base
        include ::Sidekiq::Worker

        sidekiq_options :queue => Devise::Async.queue
        def self.enqueue(*args)
          puts "Sidekiq Worker Method"
          puts  "%%%%%%%%%%%%%%%%"
          puts "#{args}"
          puts  "%%%%%%%%%%%%%%%%"
          if perform_async(*args)
            puts "works"
          else
            puts "fails"
          end
          puts "Job enqueued"
        end
      end
    end
  end
end
