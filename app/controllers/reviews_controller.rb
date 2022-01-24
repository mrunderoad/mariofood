class ReviewsController < ApplicationController

  before_action :only [:edit] do
    redirect_to products_path unless is_admin?
  end

  def new 
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review added!"
      redirect_to products_path(@product)
    else
      flash[:alert] = "Not able to add review! Please try again."
      render :new
    end
  end

  def edit 
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def show 
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[notice] = "Review updated!"
    else @product = Product.find(params[:product_id])
      flash[:alert] = "Review not updated! Please try again."
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:product_id])
    @review.destroy
    flash[:notice] = "Review deleted!"
    redirect_to products_path(@review.product)
  end

  private

  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end

end