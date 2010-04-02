class RecipesController < ApplicationController

  ## ----------------
  ## Filters
  ## ----------------
  before_filter :check_authentication

  # GET /recipes
  # GET /recipes.xml
  def index
    session[:recipe_order] = nil
    session[:recipe_current_page] = nil
    @recipes = Recipe.find(:all, :order => "created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipes }
    end
  end

  # GET /get_all_recipes
  # GET /get_all_recipes.xml
  def get_all_recipes
  end

  # GET /recipes/1
  # GET /recipes/1.xml
  def show
    @recipe = Recipe.find(params[:id])
    @title = @recipe.cheese_title
    session[:recipe_order] = "id desc"
    session[:recipe_current_page] = get_page(params[:page]) if params[:page]
    @recipe = Recipe.find(:all, :conditions => ["id <= ?", params[:id]], :order => session[:recipe_order])
    session[:recipe_current_page] = reset_page_in_session(@recipe.size, session[:recipe_current_page], 2)
    @recipes = @recipe.paginate(:page => session[:recipe_current_page], :per_page => 2, :order => session[:recipe_order])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.xml
  def new
    if !@current_user.nil? && @current_user.username == "admin"
      @recipe = Recipe.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @recipe }
      end
    else
      redirect_to(recipes_url)
    end
  end

  # GET/add_ingredient
  # used to generate new text fields for ingredient and quantity
  def add_ingrediant
  end

  # GET /recipes/1/edit
  def edit
    if !@current_user.nil? && @current_user.username == "admin"
      @recipe = Recipe.find(params[:id])
      @selected_prep_time = @recipe.prep_time
      @selected_cook_time = @recipe.cook_time
    else
      redirect_to(recipes_url)
    end
  end

  # POST /recipes
  # POST /recipes.xml
  def create
    if params[:commit] == "Cancel"
      redirect_to(recipes_url)
    else
      @recipe = Recipe.new(params[:recipe])
  
      @ingredient = false
      params[:ingredient][:ingredient].each do |ingredient|
        @ingredient = true unless ingredient.blank?
      end
      if @ingredient == false 
        flash[:error] = "Ingredient can\'t be blank."
        redirect_to(new_recipe_path)
      else
        respond_to do |format|
          if @recipe.save_obj(params)
            flash[:notice] = 'Recipe was successfully created.'
            format.html { redirect_to(recipes_url) }
            format.xml  { render :xml => @recipe, :status => :created, :location => @recipe }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
          end
        end
      #else
       # flash[:error] = "Invalid Quantity OR Ingredient."
       # redirect_to(new_recipe_path)
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.xml
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if params[:commit] == "Cancel"
        format.html { redirect_to(recipes_url) }
        format.xml  { head :ok }
      elsif @recipe.update_obj(params)
        flash[:notice] = 'Recipe was successfully updated.'
        format.html { redirect_to(recipes_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.xml
  def destroy
    if !@current_user.nil? && @current_user.username == "admin"
      @recipe = Recipe.find(params[:id])
      @recipe.destroy
  
      respond_to do |format|
        format.html { redirect_to(recipes_url) }
        format.xml  { head :ok }
      end
    else
      redirect_to(recipes_url)
    end
  end
end
