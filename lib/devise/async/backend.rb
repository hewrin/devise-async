module Devise
  module Async
    module Backend
      # Gives the desired backend driver class to be used to enqueue
      # jobs.
      def self.for(backend)
        byebug
        const_get(backend.to_s.camelize)
        byebug
      rescue NameError
        raise ArgumentError, "unsupported backend for devise-async."
      end
    end
  end
end
