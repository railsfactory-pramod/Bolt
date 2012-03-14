class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.integer :parent_id
      t.string :link_title
      t.string :file_path
      t.boolean :status

      t.timestamps
    end
  end
end
