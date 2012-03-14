class Article < ActiveRecord::Base

  
  ######   association ###########
  
  has_many :categories
  has_many :statuses
  has_many :accesses 
  
 
 ######### for FEATURED ########
 
 NO =0
 YES =1
 FEATURED_TYPES ={
   NO =>"No",
   YES =>"Yes"
   
 }   
end
