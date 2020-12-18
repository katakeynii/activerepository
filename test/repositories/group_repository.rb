require "models/blog/group"
require "models/blog/user"
require "models/blog/comment"
require "active_repository"
class GroupRepository < ActiveRepository::Base

    aggregate do 
        node :group, "Blog::Group"
    end
    
end