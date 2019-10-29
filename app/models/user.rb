class User < ApplicationRecord
    has_many :posts
    has_many :users, through: :posts

    validates :username, uniqueness: true
end
