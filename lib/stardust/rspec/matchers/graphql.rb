require "stardust/rspec/matchers/graphql/be_able_to_return_null"
require "stardust/rspec/matchers/graphql/be_able_to_return_null"
require "stardust/rspec/matchers/graphql/have_argument"
require "stardust/rspec/matchers/graphql/have_field"
require "stardust/rspec/matchers/graphql/return_type"

module Stardust
  module Rspec
    module Matchers
      module GraphQL
        include AllowAccessTo
        include BeAbleToReturnNull
        include HaveArgument
        include HaveField
        include ReturnType
      end
    end 
  end
end
