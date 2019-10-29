class UsersController < ApplicationController
    def index
        @users = User.all
        render json:@users.to_json(
            :include => {
                    :posts => {
                        :only => [ :content, :like]
                    },
                    :places => {
                        :only => [:name, :image]
                    }
          }
        )
    end

    def show
        # @user = User.find(params[:id])
        @user = User.find_by(id: params[:id])
        render json: @user.to_json(
            :include => {
                    :posts => {
                        :only => [:content, :likes ]
                    },
                    :places => {
                        :only => [:name, :image]
                    }
          }
        )
    end

    def create
        @user = User.new(user_params)
        @user.save

        if @user.save
            render json:@user
            # , status: :ok
        else 
            render json:{message: "username already taken"}
            #  mesages: 
        end
    end

    private
    def user_params
      params.require(:user).permit(:id, :username, :image, :bio)
    end
end
