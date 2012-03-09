module Bolt
  class InstallGenerator < Rails::Generators::Base
    
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)
    
    def self.next_migration_number dirname
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end
    
    def generate_files
      puts "*** WARNING - Generating configuration files. Make sure you have backed up any files before overwriting them. ***"
      
      #config helper
      copy_file "app/helpers/bolt/config_helper.rb", "app/helpers/bolt/config_helper.rb"
      
      #initial view partials
      copy_file "app/views/bolt/layouts/_left_navigation.html.erb", "app/views/bolt/layouts/_left_navigation.html.erb"
      copy_file "app/views/bolt/layouts/_right_navigation.html.erb", "app/views/bolt/layouts/_right_navigation.html.erb"
      
      #robots.txt
      puts " ** Overwrite if you haven't yet modified your robots.txt, otherwise add disallow rules for /bolt and /admin manually **"
      copy_file "public/robots.txt", "public/robots.txt"
      
      #blank stylesheets and JavaScript files
      copy_file "public/bolt/stylesheets/custom.css", "public/bolt/stylesheets/custom.css"
      copy_file "public/bolt/javascripts/custom.js", "public/bolt/javascripts/custom.js"
      
      #migrations
      migration_template 'db/migrate/bolt_create_users.rb', "db/migrate/bolt_create_users.rb"
    end  
  end
end
