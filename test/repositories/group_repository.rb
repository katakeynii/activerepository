require "models/blog/group"
class GroupRepository < ActiveRepository::Base
    model :group, "Blog::Group", root: true
    
end