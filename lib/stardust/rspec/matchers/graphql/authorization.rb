require "stardust/rspec/matchers/graphql/authorization/allow_access_to"
require "stardust/rspec/matchers/graphql/authorization/allow_anonymous"
require "stardust/rspec/matchers/graphql/authorization/deny_access_to"

module Stardust
  module Rspec
    module Matchers
      module GraphQL
        module Authorization
          include AllowAccessTo
          include AllowAnonymous
          include DenyAccessTo
        end
      end
    end
  end
end
