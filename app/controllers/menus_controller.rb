class MenusController < ApplicationController

  def edit
    user = User.find(params[:id])
    if user.menu.nil?
      @menu = user.menu.build
    else
      @menu = user.menu
    end
  end

  def update
    user = User.find(params[:id])
    @menu = user.menu
    if @menu.update_attributes(menu_params)
      flash[:success] = "Menu Updated"
      redirect_to user
    else
      render 'edit'
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:description)
  end
end
