#require "bolt"
require "rails"

module Bolt
  class Railtie < Rails::Railtie    
    rake_tasks do
      task :name do
        puts "hi"
      end
      load "bolt/railties/tasks.rake"
    end
    
  end
  
  class RouteConstraint

     def matches?(request)
       return false if request.fullpath.include?("/bolt")
       return false if request.fullpath.include?("/admin")
       true
     end

   end
end
