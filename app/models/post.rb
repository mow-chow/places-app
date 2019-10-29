class Post < ApplicationRecord
    belongs_to :user, required: true
    belongs_to :place, required: true  
end
