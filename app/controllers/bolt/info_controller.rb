module Bolt
  class InfoController < Bolt::BoltController
    layout "default_site"
    def show      
      if(request.url.match("categories"))       
        if(!params[:cat_name].nil?)
          if(!params[:cat_name].match(/article/i).nil?)
            if(!params[:id].nil?)
              @article = Article.find(params[:id].to_i)
            end
          else
          end
        end
      else
        @categories = Category.all
        @top_menu = Page.parent_menu      
        if(params[:id].nil? || !params[:id].match(/index|home/i).nil?)
          @page = Page.find_by_title("Home")        
        else      
          @page = Page.find_by_title(deformat_url_id(params[:id]))
        end
       
      end
    end
  end
end 
