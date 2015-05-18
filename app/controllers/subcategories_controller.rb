class SubcategoriesController < ApplicationController
  def new
  	@category = Category.find(params[:category_id])
  	@subcategory = Subcategory.new
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
    @category = @subcategory.category
  end

  def create
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.new(subcategory_params)
    @subcategory.category = @category
    if @subcategory.save
      redirect_to category_path(@subcategory.category), notice: 'Subcategory has been successfully created'
    else
      @subcategory = Subcategory.new
      render 'new'
    end
  end

  def update
    @subcategory = Subcategory.find(params[:id])
    @category = @subcategory.category
    if @subcategory.update(subcategory_params)
      redirect_to category_path(@subcategory.category), notice: 'Subcategory has been successfully updated'
    else
      render 'new'
    end
  end

  def destroy
    Subcategory.find(params[:id]).destroy
  end

   # Never trust parameters from the scary internet, only allow the white list through.
  def subcategory_params
    params.require(:subcategory).permit(:name)
  end
end
