class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @snowresorts= current_user.snowresorts
  end
end
