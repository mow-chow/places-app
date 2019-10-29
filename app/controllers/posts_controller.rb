class PostsController < ApplicationController
    def index
        @posts = Post.all
        render json:@posts.to_json(
            :include => {
                    :place => {
                        :only => [:name, :image]
                    },
                    :user => {
                        :only => [:username, :image, :bio]
                    }
          }
        )
    end
   
    def show
        @post = Post.find_by(id: params[:id])
        render json: @post..to_json(
            :include => {
                    :place => {
                        :only => [:name, :image]
                    },
                    :user => {
                        :only => [:username, :image, :bio]
                    }
          }
        )
    end

    def create
        @post = Post.new(post_params)
        @post.save
        render json: @post
    end


    private
    def post_params
      params.require(:post).permit(:id, :like, :content, :user_id, :place_id)
        # users_attributes: [:id, :name], places_attributes: [:id, :name, :location, :image] )
    end
end
