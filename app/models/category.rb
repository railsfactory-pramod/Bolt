class Category < ActiveRecord::Base
   
  has_many :articles_categories
  has_many :articles, :through => :articles_categories, :dependent => :destroy
  
end