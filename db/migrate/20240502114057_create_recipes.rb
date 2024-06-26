class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :image_url
      t.string :original_url
      t.text :description_url

      t.timestamps
    end
  end
end
