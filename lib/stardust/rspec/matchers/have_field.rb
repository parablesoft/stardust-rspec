module Stardust
  module Rspec
    module Matchers
      module HaveField

        RSpec::Matchers.define :have_field do |field_name,field_type,nullable|
          match do |actual|
            FieldMatcher.new(actual.fields,field_name,field_type,nullable).matches?
          end
        end


        private 

        class FieldMatcher

          def initialize(actual,field_name,field_type,nullable)
            @actual = actual
            @field_name = field_name
            @field_type = field_type
            @nullable = nullable
          end

          def matches?
            matches_name_for_field? &&
              matches_type_for_field? &&
              matches_nullable_for_field?

          end

          private

          attr_reader :actual,
            :field_name,
            :field_type,
            :nullable

          def field
            actual[camel_cased_field_name]
          end

          def camel_cased_field_name
            stringifyed_field_name.camelize(:lower)
          end

          def stringifyed_field_name
            field_name.to_s
          end


          def matches_name_for_field?
            field.original_name ==
              field_name
          end

          def matches_type_for_field?
            type_for_field ==
              Stardust::GraphQL::Collector.lookup_type(field_type)
          end

          def matches_nullable_for_field?
            nullable[:null] == nullable_for_field
          end

          def nullable_for_field
            variable_for_field("return_type_null")
          end

          def type_for_field
            variable_for_field("return_type_expr")
          end

          def variable_for_field(variable)
            field.instance_variable_get("@#{variable}")
          end
        end
      end
    end
  end
end

