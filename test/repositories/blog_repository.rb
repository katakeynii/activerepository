require "models/blog/post"
require "models/blog/user"
require "models/blog/comment"
require "active_repository"
class BlogRepository < ActiveRepository::Base
    model :user, "Blog::User"
    model :post,   "Blog::Post"
    
    def find_first
        self.class.nodes.post.find(1)
    end
end