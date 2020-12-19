require "models/blog/group"
require "active_repository"
class GroupRepository < ActiveRepository::Base
    model :group, "Blog::Group"
    
end