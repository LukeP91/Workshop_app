class ProductsController < ApplicationController

  before_action :author!, only: [:edit, :update]
  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if user_signed_in?
      self.product = Product.new(product_params)
      product.user_id = current_user.id
      if product.save
        category.products << product
        redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
      else
        render action: 'new'
      end
    else
      redirect_to new_user_session_path, notice: "You need to sign in first."
    end
  end

  def update
    if user_signed_in?
      if self.product.update(product_params)
        redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
      else
        render action: 'edit'
      end
    else
      redirect_to new_user_session_path, notice: "You need to sign in first."
    end
  end

  # DELETE /products/1
  def destroy
    if user_signed_in?
      product.destroy
      redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
    else
      redirect_to new_user_session_path, notice: "You need to sign in first."
    end
  end

  private

    def product_params
      params.require(:product).permit(:title, :description, :price, :category_id)
    end

    def author!
      unless self.product.user == current_user
        redirect_to category_product_url(category, product),
          flash: { error: 'You are not allowed to edit this product.' }
    end
end
end
