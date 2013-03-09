class Hiera
  module Backend
    class Rspec_backend
      def initialize
        Hiera.debug("Hiera RSpec backend starting")
      end

      def lookup(key, scope, order_override, resolution_type)
        answer = nil

        Hiera.debug("Looking up #{key} in RSpec backend")

        Backend.datasources(scope, order_override) do |source|
          Hiera.debug("Looking for data source #{source}")

          data = Config[:rspec]

          next if ! data
          next if data.empty?

          if data.include?(key)
            raw_answer = data[key]
          elsif data.include?(key.to_sym)
            raw_answer = data[key.to_sym]
          else
            next
          end

          # for array resolution we just append to the array whatever
          # we find, we then goes onto the next file and keep adding to
          # the array
          #
          # for priority searches we break after the first found data item
          new_answer = Backend.parse_answer(raw_answer, scope)
          case resolution_type
          when :array
            raise Exception, "Hiera type mismatch: expected Array and got #{new_answer.class}" unless new_answer.kind_of? Array or new_answer.kind_of? String
            answer ||= []
            answer << new_answer
          when :hash
            raise Exception, "Hiera type mismatch: expected Hash and got #{new_answer.class}" unless new_answer.kind_of? Hash
            anser ||= {}
            answer = new_answer.merge answer
          else
            answer = new_answer
            break
          end
        end

        return answer
      end
    end
  end
end
