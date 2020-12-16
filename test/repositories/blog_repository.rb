require "models/blog/post"
require "models/blog/user"
require "models/blog/comment"
require "active_repository"
class BlogRepository < ActiveRepository::Base

    aggregate do 
        node :user, "Blog::User"
        node :post,   "Blog::Post"
    end
    
    def find_first
        self.class.nodes.post.find(1)
    end
end