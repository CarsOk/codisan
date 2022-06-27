class UsersController < ApplicationController
    before_action :authenticate_user!
      
      def index
        authorize User
        @users = User.all
      end

      def show
        @user = User.find(params[:id])
      end
  
      def edit
          authorize User
          @user = User.find(params[:id])
      end
  
      def update
          @user = User.find(params[:id])
          if @user.update(role_params_update)
              redirect_to users_path
          else
              render :edit
          end
      end

    #  def new
    #    @user = User.new
    #  end     
    
    #  def create
    #    @user = User.new(role_params)
    #    if @user.save
    #        redirect_to users_path
    #        flash[:notice] = "User created successfully"
    #    else
    #       flash[:notice] = "User not created"
    #        render :new

    #    end
    #  end

    def destroy
      
          if @user.destroy
              flash[:alert] = "usuario eliminado"
              redirect_to users_path
          else
              render :edit
          end
    end

      private

      def role_params_update
        params.require(:user).permit({role_ids:[]})
      end
    
    end