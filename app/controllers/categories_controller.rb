class CategoriesController < ApplicationController

  #show a list of all categories
  def index
    @categories = category.order(:title).limit(50)
    respond_with(@categories)
  end

  # show a single category with all its tweets.
  def show
    @category = Category.includes(:tweets).
      order('tweets.tweeted_at desc').find(params[:id])
    respond_with(@category)
  end

  # Show a form for a new Category
  def new
    @category = Category.new
    respond_with(@category)
  end

  # actually create the category.
  def create
    @category = Category.create(params[:category])
    respond_with(@category)
  end

  # Form to create a category
  def edit
    @category = Category.find(params[:id])
  end

  # Update the category in the database.
  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    respond_with(@category)
  end

  # Delete categories that don't have any tweets
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_with(@category)
  end

end
