class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: :show

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    @category = Category.new
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @categories = Category.all
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    if User.find_by(id: session[:user_id]).admin_type == nil
      flash[:notice] = "Only admin can edit a category!"
      redirect_to(:controller => "categories", :action => "index")
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    @categories = Category.all
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        if User.find_by(id: session[:user_id]).admin_type != nil
          if @categories.find_by(name: @category.name) != nil
            #@categories.find(:all, :conditions => ["name = ? AND status = ?", @category.name,"pending"]).delete
            Category.destroy_all(:name => @category.name, :status => "pending")
          end
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
        else
        format.html { redirect_to @category, notice: 'Category was successfully proposed but will not be seen before approved by admin.' }
        format.json { render action: 'show', status: :created, location: @category }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :status)
    end
end
