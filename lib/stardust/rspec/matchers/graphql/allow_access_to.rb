
module Stardust
  module Rspec
    module Matchers
      module GraphQL
        module AllowAccessTo
          RSpec::Matchers.define :allow_access_to do |expected|
            match do |actual|
              expected.select do |user_type|
                u = create(user_type)
                actual.authorized?(nil,current_user: u)
              end.length == expected.length
            end
          end
        end
      end
    end
  end
end
