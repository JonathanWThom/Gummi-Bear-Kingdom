class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product Successfully Created"
      redirect_to products_path
    else
      flash[:error] = "Please Try Again"
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product Successfully Updated"
      redirect_to product_path(@product)
    else
      flash[:error] = "Please Try Again"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product Successfully Deleted"
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :cost, :country, :image)
  end
end
