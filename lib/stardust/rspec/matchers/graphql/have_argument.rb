module Stardust
  module Rspec
    module Matchers
      module HaveArgument

        RSpec::Matchers.define :have_argument do |params|
          match do |actual|
            ArgumentMatcher.new(actual.get_arguments,params).matches?
          end
        end

        private

        class ArgumentMatcher
          def initialize(actual,params)
            @actual = actual
            @params = params
          end

          def matches?

            matches_name? &&
              matches_type? &&
              matches_description? &&
              matches_named_args?
          end


          private
          attr_reader :actual,:params

          def matches_name?
            actual_name == expected_name
          end

          def matches_type?
            actual_type == expected_type
          end

          def matches_description?
            actual_description == expected_description
          end


          def matches_named_args?
            actual_named_args == expected_named_args
          end

          def actual_name
            instance[0]
          end

          def actual_type
            instance[1]
          end

          def actual_description
            instance[2]
          end

          def actual_named_args
            instance[3]
          end

          def instance
            actual.find {|item| item.first == expected_name}
          end

          def expected_name
            params.fetch(:name,nil)
          end

          def expected_type
            params.fetch(:type, nil)
          end

          def expected_description
            params.fetch(:description,nil)
          end

          def expected_named_args
            params.fetch(:named_args,{})
          end
        end
      end
    end
  end
end
