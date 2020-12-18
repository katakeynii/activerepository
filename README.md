# Activerepository

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/activerepository`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerepository'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerepository

## Usage

Actually I'm working the Rails generator so that you cant generate repositories same as you generate your models.
But still you can create a directory `app/repositories` and put it all your futur repositories. Here we are going to create two repositories a Group Repository and a Blog Repository. A repository inherit from the ActiveRepository::Base class
```ruby
# app/repositories/blog_repository.rb 
class BlogRepository < ActiveRepository::Base

    aggregate do 
        node :user, "Blog::User"
        node :post,   "Blog::Post"
    end
    
end
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/activerepository. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Activerepository project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/activerepository/blob/master/CODE_OF_CONDUCT.md).
