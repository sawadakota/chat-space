class UsersController < ApplicationController
  def search
    @users = User.where("name like ?", "%#{params[:name]}%")
  end
end
