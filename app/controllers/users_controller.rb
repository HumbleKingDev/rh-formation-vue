class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @users = User.all
        render json:@users
    end
    def details
        @user = User.find(params[:id])
        render json: {data: @user, status: "ok", message: 'Success'}
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: {stautus: "ok", message: "Updated!"}
        else
           render json: {json: @user.errors, status: unprocessable_entity} 
        end
    end
    def user_params 
        params.require(:user).permit(:id, :first_name, :last_name, :email, :phone,:address)
    end
    def destroy
        @user = User.find(params[:id])
        if @user.destroy
          render json: { json: 'User was successfully deleted.'}
        else
          render json: { json: @user.errors, status: :unprocessable_entity }
        end
    end
    def create
        @user = User.new(user_params)
        if @user.save
            render json: { status: :"ok", message: 'Success' }
        else
            render json: { json: @user.errors, status: :unprocessable_entity }
        end
    end
end

# skip_before_action :verify_authenticity_token