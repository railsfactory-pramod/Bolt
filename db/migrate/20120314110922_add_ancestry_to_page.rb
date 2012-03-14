class AddAncestryToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :ancestry, :string
    add_index :pages, :ancestry 
  end
 
  def self.down
    remove_column :pages, :ancestry, :string
    remove_index :pages, :ancestry
  end
end
