require "stardust/rspec/matchers/have_field"
require "stardust/rspec/matchers/have_argument"
require "stardust/rspec/matchers/return_type"
require "stardust/rspec/matchers/be_able_to_return_null"

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
