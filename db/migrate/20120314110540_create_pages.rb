class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :path
      t.string :title
      t.integer :show_in_menu
      t.string :link_url
      t.integer :deletable
      t.string :menu_match
      t.integer :status
      t.string :view_template
      t.string :default_template
      
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end