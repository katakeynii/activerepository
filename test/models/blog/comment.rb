module Blog
    class Comment < ActiveRecord::Base
        belong_to :user
        belong_to :post
    end    
end
