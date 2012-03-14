module Bolt
  class PagesController < Bolt::BoltController
    
    ## optional filters for defining usage according to Bolt::Users access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
    
    def index
      @bolt_page_title = 'Pages'
      @pages = Page.paginate :page => params[:page]
    end
    
    def show
      @bolt_page_title = 'View page'
      @page = Page.find params[:id]
    end
    
    def new
      @bolt_page_title = 'Add a new page'
      @page = Page.new
    end

    def create     
      if(!params[:parent].blank? && params[:parent].to_i > 0)
        parent = Page.find(params[:parent].to_i)
      end
      @page = Page.new params[:page]        
      @page.parent_id = parent.id if(!parent.nil?)
           
      if @page.save
        flash[:notice] = 'Page created'
        redirect_to bolt_pages_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new page'
        render :action => :new
      end
    end
    
    def update
      @bolt_page_title = 'Update page'
      
      @page = Page.find params[:id]
      
      if @page.update_attributes params[:page]
        flash[:notice] = 'Page has been updated'
        redirect_to bolt_pages_path
      else
        flash.now[:warning] = 'There were problems when trying to update this page'
        render :action => :show
      end
    end
    
    def destroy
      @page = Page.find params[:id]

      @page.destroy
      flash[:notice] = 'Page has been deleted'
      redirect_to bolt_pages_path
    end
    
  end
end
