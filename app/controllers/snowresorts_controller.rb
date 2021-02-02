class SnowresortsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :snowresort_find, only: [:show, :edit, :update, :destroy]

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

  def show
    @comment = Comment.new
    @comments = @snowresort.comments.includes(:user)
  end

  def edit
  end

  def update
    if @snowresort.update(snowresort_params)
      redirect_to snowresort_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @snowresort.user_id
      @snowresort.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  def snowresort_find
    @snowresort = Snowresort.find(params[:id])
  end

  private

  def snowresort_params
    params.require(:snowresort).permit(:image, :resort_name, :introduction, :details).merge user_id: current_user.id
  end

end
