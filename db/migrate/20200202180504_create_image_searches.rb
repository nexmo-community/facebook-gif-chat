class CreateImageSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :image_searches do |t|

      t.timestamps
    end
  end
end
