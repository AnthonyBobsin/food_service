class MenusController < ApplicationController

  # Gets called if user.menu.nil? creates and saves a menu model for current user
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

  # Supplies variables for edit.html.erb handling null models.
  def edit
    user = User.find(params[:id])
    if user.menu.nil?
      @menu = user.build_menu
      @menu.id = user.id
    else
      @menu = user.menu
    end
    @menu_items = @menu.menu_items
    @new_item = @menu.menu_items.build
  end

  # Get called after submit button is pressed on edit menu form
  def update
    user = User.find(params[:id])
    @menu = user.menu
    if @menu
    if @menu.update_attributes(menu_params)
        if params[:commit] == "Add Another Entry"
            flash[:success] = "Entry added"
             redirect_to edit_menu_url
        else
            flash[:success] = "Menu Updated"
            redirect_to user
        end
      else
        render 'edit'
      end
    else
      @menu = user.build_menu
      @menu.id = user.id
      redirect_to user
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:user_id, :description, menu_items_attributes: [:id, :item, :price])
  end

  def build_item
  end

end
