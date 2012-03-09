

module Bolt
  class ArticlesController < Bolt::BoltController
  
    ## optional filters for defining usage according to Bolt::Users access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @bolt_page_title = 'Articles'
  		@articles = Article.paginate :page => params[:page]
    end
  
    def show
      @bolt_page_title = 'View article'
      @article = Article.find params[:id]
    end
 
    def new
      @bolt_page_title = 'Add a new article'
    	@article = Article.new
    end

    def create
      @article = Article.new params[:article]
    
      if @article.save
        flash[:notice] = 'Article created'
        redirect_to bolt_articles_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new article'
        render :action => :new
      end
    end
  
    def update
      @bolt_page_title = 'Update article'
      
      @article = Article.find params[:id]
    
      if @article.update_attributes params[:article]
        flash[:notice] = 'Article has been updated'
        redirect_to bolt_articles_path
      else
        flash.now[:warning] = 'There were problems when trying to update this article'
        render :action => :show
      end
    end
 
    def destroy
      @article = Article.find params[:id]

      @article.destroy
      flash[:notice] = 'Article has been deleted'
      redirect_to bolt_articles_path
    end

    def destroy_multiple
    ids= params[:id]
    idarr=ids.split(',')
    idarr.each do |del|
      @article = Article.find(del)
      @article.destroy
    end
    respond_to do |format|
      format.html { redirect_to :back  }
      # format.json { head :ok }
    end
    
  end
  
  end
end
