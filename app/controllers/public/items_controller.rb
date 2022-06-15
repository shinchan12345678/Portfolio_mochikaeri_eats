class Public::ItemsController < Public::ApplicationController
  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.page params[:page]
    respond_to do |format|
      format.html
      format.js
    end
  end
end
