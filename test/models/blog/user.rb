
module Blog
    
    class User < ActiveRecord::Base
        has_many :posts
        has_many :comments
        has_and_belongs_to_many :groups
    end
end