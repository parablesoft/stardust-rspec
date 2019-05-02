module Stardust
  module Rspec
    module Matchers
      module BeAbleToReturnNull
        RSpec::Matchers.define :be_able_to_return_null do |expected|
          match do |actual|
            actual.get_null == expected
          end
        end
      end
    end
  end
end
