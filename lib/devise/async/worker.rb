module Devise
  module Async
    class Worker
      class << self

      # Used is the internal interface for devise-async to enqueue notifications
      # to the desired backend.
      def enqueue(method, resource_class, resource_id, *args)
        # convert args to strings and hashes with string keys before passing to backend
        args = stringify_args args
        puts "@@@@@@@@@@@@@@@@@@@@@@"
        puts "in worker enqueue method"
        backend_class.enqueue(method, resource_class, resource_id, *args)
      end

      private

      def stringify_args(args)
         
        args.map do |a|
          case a
            when Hash
              a.stringify_keys
            when Symbol
              a.to_s
            else
              a
          end
        end
      end

      def backend_class
        puts "@@@@@@@@@@@@@@@@@@@@@@"
        puts "#{Backend.for(Devise::Async.backend)}"
        puts "@@@@@@@@@@@@@@@@@@@@@@"
        Backend.for(Devise::Async.backend)

      end
        end
    end
  end
end
