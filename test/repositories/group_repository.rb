require "models/blog/group"
require "active_repository"
class GroupRepository < ActiveRepository::Base
    aggregate do 
        node :group, "Blog::Group"
    end
    
end