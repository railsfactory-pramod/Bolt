class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :site_name
      t.string :logo_path
      t.string :slogan
      t.string :footer_text
      
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end