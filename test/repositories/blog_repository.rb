require "models/blog/post"
require "models/blog/user"
require "models/blog/comment"
require "active_repository"
class BlogRepository < ActiveRepository::Base

    aggregate do 
        node :author, "Blog::Author"
        node :post,   "Blog::Post"

    end
    
end