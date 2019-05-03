# Stardust::Rspec
Short description and motivation.

## Usage


### Matchers

#### GraphQL

For testing both queries and types you'll want to set the subject to described_class, as Rspec will automatically try to create an instance of the class, which is not possible with the Stardust GraphQL types and queries. Each matcher takes the subject and uses the appropriate property on the subject for its testing purposes.

To set the subject, simply use this snippet in the context of your testing of the types and queries. 

```ruby
subject {described_class}
```

For other tests of the class, you can wrap them in a context or describe and use a different subject if needed.

<hr/>

##### Testing Queries

For testing queries, you'll want to test that the query has:

* the proper return type
* for all arguments it should take
* if it can return null
* what **resolve** does


**Return Type**
```ruby
it{should return_type(:symbol_of_your_return_type)}
```

**Arguments**
```ruby
it{should have_argument({name: :id, type: :id, named_args: {required: true}})}
```

**Nullability**
```ruby
it{should be_able_to_return_null(true)}
```

**resolve**

There are no matchers for resolve at the moment. What resolve does is what makes the query unique, so while there may be an opportunity to create matchers for common things, we don't have any yet. You should unit test resolve as you would any other method on a class.

<hr/>




##### Testing Types

For types, we want to test that the proper fields are present. Below is a full example.

```ruby
require "rails_helper"
RSpec.describe Stardust::GraphQL::Collector.types[:line_item] do

  subject {described_class}
  describe "fields" do
    it{should have_field(:id,:id, null:false)}
    it{should have_field(:details,:details, null:false)}
    it{should have_field(:product,:product, null:true)}
  end

end

```

In this example for the type **line_item** set the subject as described above, then we put the fields in a describe block. From there we test each field to make sure it is present with the right ***name***,***data type***, and ***nullability***.


In the example below, we want to make sure that the type has a field named id, with the type of id, and it cannot be null.
```ruby
it{should have_field(:id,:id, null:false)}
```

In the example below, we want to make sure that the type has a field named name, with the type of string and it can be null.

```ruby
it{should have_field(:name,:string, null:true)}
```

In the example below, we want to make sure that the type has a field named line\_items, that returns an array of the type line\_item and it cannot be null.

```ruby
it{should have_field(:line_items,[:line_item], null:false)}
```

<hr/>

## Installation
Add this line to your application's Gemfile, within the test group:

```ruby
group :test do
  gem 'stardust-rspec', git: 'git@github.com:hatch-software/startdust-rspec.git'
end
```

And then execute:
```bash
$ bundle
```


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
