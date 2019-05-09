module Stardust
  module Rspec
    module Matchers
      module GraphQL
        module AllowAnonymous
          RSpec::Matchers.define :allow_anonymous do |expected|
            match do |actual|
              actual.authorized?(nil, current_user: nil) == expected
            end
          end
        end
      end
    end
  end
end
