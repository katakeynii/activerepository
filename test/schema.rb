ActiveRecord::Schema.define do
    self.verbose = false
  
    create_table :users, :force => true do |t|
      t.string :email
      t.string :name
      t.string :pseudo
      t.integer :age
  
      t.timestamps
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
    
        t.timestamps
    end

    create_table :comments, :force => true do |t|
        t.string :content
        t.datetime :publish_at
        t.references :user
        t.references :post
    
        t.timestamps
    end


    create_table :towns, :force => true do |t|
        t.string :name
    end

    create_table :climat_quotidiens, :force => true do |t|
        t.datetime :frame_date
        t.float :temp_moy_c
        t.float :temp_min_c
        t.float :temp_max_c
        t.float :temp_moy_f
        t.float :temp_min_f
        t.float :temp_max_f
        t.float :precipitation
        t.references :town

    end

end