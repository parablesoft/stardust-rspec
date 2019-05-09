module Stardust
  module Rspec
    module Matchers
      module GraphQL
        module BeAbleToReturnNull
          RSpec::Matchers.define :be_able_to_return_null do |expected|
            match do |actual|
              expected.nil? ? actual.get_null : actual.get_null == expected
            end
          end
        end
      end
    end
  end
end
