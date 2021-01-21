class SnowresortsController < ApplicationController

  def index
    @snowresorts = Snowresort.all
  end

  def new 
    @snowresort = Snowresort.new
  end

  def create
    @snowresort = Snowresort.new(snowresort_params)
    if @snowresort.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def snowresort_params
    params.require(:snowresort).permit(:image, :resort_name, :introduction, :details).merge user_id: current_user.id
  end

end
