module Stardust
  module Rspec
    module Matchers
      module GraphQL
        module DenyAccessTo
          RSpec::Matchers.define :deny_access_to do |expected|
            match do |actual|
              expected.select do |user_type|
                u = create(user_type)
                actual.authorized?(nil,current_user: u) == false
              end.length == expected.length
            end
          end
        end
      end
    end
  end
end
