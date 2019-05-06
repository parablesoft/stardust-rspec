require "stardust/rspec/matchers/graphql/have_field"
require "stardust/rspec/matchers/graphql/have_argument"
require "stardust/rspec/matchers/graphql/return_type"
require "stardust/rspec/matchers/graphql/be_able_to_return_null"

module Stardust
  module Rspec
    module Matchers
      include HaveField
      include HaveArgument
      include ReturnType
      include BeAbleToReturnNull
    end
  end
end
