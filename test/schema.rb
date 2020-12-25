ActiveRecord::Schema.define do
    self.verbose = false
  
    create_table :users, :force => true do |t|
      t.string :email
      t.string :name
      t.string :pseudo
      t.integer :age

    end


    create_table :groups, :force => true do |t|
        t.string :name
        t.text :description
    
    end
    
    create_join_table :users, :groups

    create_table :posts, :force => true do |t|
        t.string :title
        t.text :content
        t.datetime :publish_at
        t.references :user
        t.references :group, null: true
    
    end

    create_table :comment, :force => true do |t|
        t.string :content
        t.datetime :publish_at
        t.references :user
        t.references :post
    
    end


end