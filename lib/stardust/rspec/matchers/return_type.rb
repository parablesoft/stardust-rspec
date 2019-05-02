module Stardust
  module Rspec
    module Matchers
      module ReturnType
        RSpec::Matchers.define :return_type do |expected|
          match do |actual|
            actual.get_type == expected
          end
        end
      end
    end
  end
end
