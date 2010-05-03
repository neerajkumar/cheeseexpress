class RetailOutletsController < ApplicationController
  
  ## ----------------
  ## Filters
  ## ----------------
  before_filter :check_authentication
  
  # GET/retail_outlets
  # GET/retail_outlets.xml
  def index
    @title = "Retail Outlet" 
    @retail_outlets = RetailOutlet.find(:all)
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @retail_outlets }
    end
  end

  # GET /retail_outlets/new
  # GET /retail_outlets/new.xml
  def new
    if !@current_user.nil? && @current_user.username == "admin"
      @title = "Retail Outlet"
      @retail_outlet = RetailOutlet.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @retail_outlet }
      end
    else
      redirect_to(retail_outlets_url)
    end
  end

  # POST /retail_outlets
  # POST /retail_outlets.xml
  def create
    if !@current_user.nil? && @current_user.username == "admin"
      @retail_outlet = RetailOutlet.new(params[:retail_outlet])

      respond_to do |format|
        if @retail_outlet.save
          flash[:notice] = 'Outlet is successfully created.'
          format.html { redirect_to(new_retail_outlet_path) }
          format.xml  { render :xml => @retail_outlet, :status => :created, :location => @retail_outlet }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @retail_outlet.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to(retail_outlets_url)
    end
  end

  # GET /retail_outlet/1/edit
  # GET /retail_outlet/1/edit.xml
  def edit
    if !@current_user.nil? && @current_user.username == "admin"
      @retail_outlet = RetailOutlet.find_by_id(params[:id])
    else
      redirect_to(retail_outlets_url)
    end
  end
  
  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    if !@current_user.nil? && @current_user.username == "admin"
      @retail_outlet = RetailOutlet.find_by_id(params[:id])

      respond_to do |format|
        if @retail_outlet.update_attributes(params[:retail_outlet])
          flash[:notice] = 'Outlet Information is successfully updated.'
          format.html { redirect_to(retail_outlets_url) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @retail_outlet.errors, :status => :unprocessable_entity }
        end
      end
    else
        redirect_to(retail_outlets_url)
    end
  end

  # DELETE /retail_outlet/1
  # DELETE /retail_outlet/1.xml
  def destroy
    if !@current_user.nil? && @current_user.username == "admin"
      @retail_outlet = RetailOutlet.find(params[:id])
      @retail_outlet.destroy

    respond_to do |format|
      flash[:notice] = "Outlet is successfully deleted."
      format.html { redirect_to(retail_outlets_url) }
      format.xml  { head :ok }
    end
    else
      return(redirect_to(retail_outlets_url))
    end
  end

end
