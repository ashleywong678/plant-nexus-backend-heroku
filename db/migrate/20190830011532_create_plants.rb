class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :scientific_name
      t.string :image_url
      t.integer :user_id
    end
  end
end
