class CreateImageEditors < ActiveRecord::Migration[6.0]
  def change
    create_table :image_editors do |t|

      t.timestamps
    end
  end
end
