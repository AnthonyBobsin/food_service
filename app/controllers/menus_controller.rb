class MenusController < ApplicationController

  def create
    user = current_user
    @menu = user.build_menu
    @menu.id = user.id
    if @menu.save
      flash[:success] = "Menu Updated"
      redirect_to @menu.user
    else
      render 'edit'
    end
  end

  def edit
    user = User.find(params[:id])
    if user.menu.nil?
      @menu = user.build_menu
      @menu.id = user.id
    else
      @menu = user.menu
    end
    @menu_items = @menu.menu_items
  end

  def update
    user = User.find(params[:id])
    @menu = user.menu
    if @menu
      if @menu.update_attributes(menu_params)
        flash[:success] = "Menu Updated"
        redirect_to user
      else
        render 'edit'
      end
    else
      @menu = user.build_menu
      @menu.id = user.id
      redirect_to @menu.user
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:user_id, :description, menu_items_attributes: [:user_id, :item, :price])
  end

end
