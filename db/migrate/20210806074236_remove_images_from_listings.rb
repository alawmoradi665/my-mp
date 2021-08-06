class RemoveImagesFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :images, :string
  end
end
