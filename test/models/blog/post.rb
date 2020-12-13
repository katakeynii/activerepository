require "active_record"
module Blog
   class Post < ActiveRecord::Base
      has_many :comments
      belongs_to :user 
   end    
end
