class PagesController < ApplicationController
  def index
    @pages = Page.all.arrange(:order => :created_at)
    @page = Page.new
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to pages_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      redirect_to pages_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url
  end

  def page_params
    params.require(:page).permit(:parent_id, :name)
  end
end
