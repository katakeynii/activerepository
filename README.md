# Active Repository
[![security](https://hakiri.io/github/katakeynii/activerepository/master.svg)](https://hakiri.io/github/katakeynii/activerepository/master)
[![Coverage Status](https://coveralls.io/repos/github/katakeynii/activerepository/badge.svg?branch=master)](https://coveralls.io/github/katakeynii/activerepository?branch=master)
[![Build Status](https://travis-ci.com/katakeynii/activerepository.svg?branch=master)](https://travis-ci.com/katakeynii/activerepository)


Welcome !! 
This gem aim is to add repository patter over rails activerecord implementation. Our objectives are not create a replacement for rails ORM activerecord
## You might ask why ? 
Well! Lately working on a large projet with a large code base. And we finally ended with enormous models where we have associations, validations and *queries* than break the Single Responsibility Principle (SRP) . And then comes to mind why not put queries in seperate class ? How would we call thoses classes : Where comes to mind the Repository Pattern. 

From his book Martin Fowler defines a repository as a class that: *Mediates between the domain and data mapping layers using a collection-like interface for accessing domain objects* [Repository M. Fowler](https://martinfowler.com/eaaCatalog/repository.html). That means repositories encapsulates logic to have access data in his responsibility. 

We define a repository as data access class from aggregated nodes or models. 

In this, each repository has a cluster of rails models called nodes (Nodes are nothing else than Models). 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_repository', :git => 'git://github.com/katakeynii/activerepository.git'
```

And then execute:

    $ bundle


## Usage

You can generate repositories with  commands below :

```bash
  rails g repository post
```
```bash
  rails g repository blog user:blog/user post:blog/post --aggregate
```
But still you can create a directory `app/repositories` and put it all your futur repositories. Here we are going to create two repositories a Group Repository and a Blog Repository. A repository inherit from the ActiveRepository::Base class
```ruby

# app/repositories/post_repository.rb 
class Blog::PostRepository < ActiveRepository::Base
    model :post,   "Blog::Post"
    
end
# app/repositories/blog_repository.rb 
class BlogRepository < ActiveRepository::Base
    model :user, "Blog::User"
    model :post,   "Blog::Post"
    
    # define class that fetch last node
    def last_post
        self.class.nodes.post
    end
end

# app/repositories/comment_repository.rb 
class Blog::CommentRepository < ActiveRepository::Base
    model :post,   "Blog::Comment"
    
end
```


From Controller or Services 

```ruby
#  find first article
 BlogRepository.nodes.post.find(1)

 #find published articles
 BlogRepository.nodes.post.where(published: true)

 #Create a user
 BlogRepository.nodes.user.create! firstname: "John", name: "Doe"
```

## TODOS
  - Aggregate root implementation
  - Query Builder based on Arel
  - PL/SQL function caller
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/activerepository. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Activerepository project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/activerepository/blob/master/CODE_OF_CONDUCT.md).
