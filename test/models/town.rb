class Town < ActiveRecord::Base
    has_many :climat_quotidiens
    
end