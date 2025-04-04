class UsersController < ApplicationController
  def index
    @order = params[:order]
    @users = case @order
             when "name"
               User.order(:name)
             when "recent"
               User.order(created_at: :desc)
             else
               User.all
             end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "Creado correctamente."
    else
      render :new, alert: "Hubo un error"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

