  class CheeseLibrariesController < ApplicationController
  
  ## ----------------
  ## Filters
  ## ----------------
  before_filter :check_authentication

  # GET /cheese_libraries
  # GET /cheese_libraries.xml
  def index
    @title = t "index.title"
    set_show_session

    @cheeses = Array.new
    @milk_type = MilkType.find_by_milk_type(params[:composition]) || MilkType.find_by_milk_type_in_french(params[:composition]) unless params[:composition].nil? || params[:composition] == "All" || params[:composition].blank?
    @cheese_type = CheeseType.find_by_cheese_type(params[:pate]) || CheeseType.find_by_cheese_type_in_french(params[:pate])
    @region = Region.find_by_region(params[:region])

    conditions = []
    count = 1
    3.times do
      if params[:composition].nil? || params[:composition].blank? || params[:composition] == "Tous" || params[:composition] == "All"
        if !@cheese_type.nil?
          if @region.nil? || @region.blank?
            conditions << ["milk_type_id = ? AND cheese_type_id = ?", count, @cheese_type.id]
          else
            conditions << ["milk_type_id = ? AND cheese_type_id = ? AND region_id = ?", count, @cheese_type.id, @region.id]
          end
        else
          if @region.nil? || @region.blank?
            conditions << ["milk_type_id = ?", count]
          else
            conditions << ["milk_type_id = ? AND region_id = ?", count, @region.id]
          end
        end
      else
        if !@cheese_type.nil?
          if @region.nil? || @region.blank?
            conditions << ["milk_type_id = ? AND cheese_type_id = ?", @milk_type.id, @cheese_type.id]
          else
            conditions << ["milk_type_id = ? AND cheese_type_id = ? AND region_id = ?", @milk_type.id, @cheese_type.id, @region.id]
          end
          break
        else
          if @region.nil? || @region.blank?
            conditions << ["milk_type_id = ?", @milk_type.id]
          else
            conditions << ["milk_type_id = ? AND region_id = ?", @milk_type.id, @region.id]
          end
        end
      end
      count += 1
    end
    
    if params[:composition].nil? || params[:composition] == "All" || params[:composition].blank? || params[:composition] == "Tous"
      conditions.each do |condition|
        @cheeses << CheeseLibrary.find(:all, :conditions => condition, :order => "id desc")
      end
      @selected_cheese_type = (I18n.locale == "en" ? @cheese_type.cheese_type : @cheese_type.cheese_type_in_french) unless @cheese_type.nil?
      @selected_region = @region.region unless @region.nil?
    else
      @cheeses << CheeseLibrary.find(:all, :conditions => conditions[0], :order => "id desc")
      @selected_milk_type = (I18n.locale == "en" ? @milk_type.milk_type : @milk_type.milk_type_in_french) unless @milk_type.nil?
      @selected_cheese_type = (I18n.locale == "en" ? @cheese_type.cheese_type : @cheese_type.cheese_type_in_french) unless @cheese_type.nil?
      @selected_region = @region.region unless @region.nil?
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cheeses }
    end
  end

  # GET /cheese_libraries/1
  # GET /cheese_libraries/1.xml
  def show
    @cheeze = CheeseLibrary.find(params[:id])
    @title = @cheeze.cheese_title
    session[:cheese_order] = "id desc"
    session[:current_page] = get_page(params[:page]) if params[:page]
    @cheese = CheeseLibrary.find(:all, :conditions => ["id <= ? AND milk_type_id = ?", params[:id], @cheeze.milk_type.id], :order => session[:cheese_order])
    session[:current_page] = reset_page_in_session(@cheese.size, session[:current_page], 2)
    @cheeses = @cheese.paginate(:page => session[:current_page], :per_page => 2, :order => session[:cheese_order])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cheeses }
    end
  end

  # GET /cheese_libraries/new
  # GET /cheese_libraries/new.xml
  def new
    if !@current_user.nil?
      @title = "Add a New Cheese"
      set_show_session
      @cheese = CheeseLibrary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cheese }
    end
    else
      return(redirect_to(:action => "index", :controller => "cheese_libraries"))
    end

  end

  # GET /cheese_libraries/1/edit
  def edit
    if !@current_user.nil?
      @title = "Edit Cheese"
      set_show_session

      @cheese = CheeseLibrary.find_by_id(params[:id])
      @selected_milk_type = (I18n.locale == 'en' ? MilkType.find_by_id(@cheese.milk_type_id).milk_type : MilkType.find_by_id(@cheese.milk_type_id).milk_type_in_french)
      @selected_region = Region.find_by_id(@cheese.region_id).region
      @selected_cheese_type = (I18n.locale == 'en' ? CheeseType.find_by_id(@cheese.cheese_type_id).cheese_type : CheeseType.find_by_id(@cheese.cheese_type_id).cheese_type_in_french)

      @selected_aoc = (@cheese.aoc == ('Yes' || 'Oui') ? (t 'aoc-yes') : (t 'aoc-no'))
    else
      return(redirect_to(cheese_libraries_path))
    end
  end

  # POST /cheese_libraries
  # POST /cheese_libraries.xml
  def create
    @cheese = CheeseLibrary.new(params[:cheese_library])

    respond_to do |format|
      if params[:commit] == "Cancel" || params[:commit] == "Annuler"
        format.html { redirect_to(cheese_libraries_path) }
      elsif (params[:commit] == "Save" || params[:commit] == "Sauf") && @cheese.save_obj(params)
          flash[:notice] = "Cheese is successfully created."
          format.html { redirect_to(cheese_libraries_url) }
          format.xml  { render :xml => @cheese, :status => :created, :location => @cheese }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cheese.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /cheese_libraries/1
  # PUT /cheese_libraries/1.xml
  def update
    @cheese = CheeseLibrary.find_by_id(params[:id])

    respond_to do |format|
      if params[:commit] == "Cancel"
        format.html { redirect_to(cheese_libraries_path) }
      elsif @cheese.update_obj(params)
        flash[:notice] = 'Cheese is successfully updated.'
        format.html { redirect_to(cheese_libraries_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cheese.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cheese_libraries/1
  # DELETE /cheese_libraries/1.xml
  def destroy
    if !@current_user.nil?
      @cheese = CheeseLibrary.find(params[:id])
      @cheese.destroy

    respond_to do |format|
      flash[:notice] = "Cheese is successfully deleted."
      format.html { redirect_to(cheese_libraries_url) }
      format.xml  { head :ok }
    end
    else
      return(redirect_to(cheese_libraries_path))
    end
  end

  ## ----------------
  ## Private Actions
  ## ----------------

  private
  
  # set the session values of show page
  def set_show_session
    session[:cheese_order] = nil
    session[:current_page] = nil
  end
  
end
