class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end 

  def create
    @category = Category.create(cat_params)
    if @category.save
      flash[:notice] = "Category created!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

    def cat_params
      params.require(:category).permit(:name)
    end
end