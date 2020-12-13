require "models/blog/post"
require "models/blog/user"
require "active_repository"
class BlogRepository
    include ActiveRepository::Aggregate
    aggregate do 
        node :author, Blog::Author
        node :post,   Blog::Post

    end
    
end