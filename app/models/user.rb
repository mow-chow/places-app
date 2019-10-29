class User < ApplicationRecord
    has_many :posts
    has_many :places, through: :posts

    validates :username, uniqueness: true
end
