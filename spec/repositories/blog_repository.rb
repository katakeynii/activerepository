class BlogRepository
    include ActiveRecord::Aggregate
    aggregate do 
        node :author, 'Blog::Author'
        node :post, 'Blog::Post'

    end
    
end