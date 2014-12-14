class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @categories = Categorie.all.order(name: :asc)
    @categories_count = Course.categories_count
  end

  def show
    @courses = Course.find_by_categorie_id(params[:id])
  end

  def new
    @category = Categorie.new
  end

  def edit
  end

  def create
    @category = Categorie.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'La catégorie a bien été ajoutée.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'La catégorie a bien été modifiée.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'La catégorie a bien été supprimée.' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Categorie.find(params[:id])
      render_404 if @category.nil?
    end

    def category_params
      params.require(:categorie).permit(:name)
    end
end
