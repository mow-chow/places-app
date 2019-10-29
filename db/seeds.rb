# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.delete_all
User.delete_all
Place.delete_all



test_user = User.create(username: 'test', image: 'user image', bio: 'user bio')
test_user_2 = User.create(username: 'test 2', image: 'user image', bio: 'user bio')
    
# seed data with a list of atlanta neighborhoods to choose from
test_place = Place.create(name: 'test  place', image: 'img src')
test_place_2 = Place.create(name: 'test  place 2', image: 'img src')

test_post = Post.create( content: 'test post',like: 0 ,place_id: Place.last.id , user_id: User.last.id,)
test_post_2 = Post.create( content: 'test post numero 2',like: 0, place_id: Place.last.id, user_id: User.last.id)
