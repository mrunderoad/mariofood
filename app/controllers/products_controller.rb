class ProductsController < ApplicationController

  before_action :only => [:new, :edit, :destroy] do
    flash[:alert] = "Must be an admin to continue" unless is_admin?
    redirect_to products_path unless is_admin?
  end

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product added!"
      redirect_to products_path
    else
      flash[:alert] = "Not able to add product! Please try again."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product updated!"
      redirect_to products_path
    else
      flash[:alert] = "Not able to update! Please try again."
      render :edit
    end
  end

  def destroy 
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product Deleted!"
    redirect_to products_path
  end

  def landing
    @recent = Product.most_recent
    @origin = Product.country_of_origin
    @popular = Product.most_reviews
    render :landing
  end

  private

  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end

end