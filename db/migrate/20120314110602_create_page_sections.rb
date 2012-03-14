class CreatePageSections < ActiveRecord::Migration
  def self.up
    create_table :page_sections do |t|
      t.integer :page_id
      t.string :title
      t.text :body
      t.integer :position
      
      t.timestamps
    end
  end

  def self.down
    drop_table :page_sections
  end
end