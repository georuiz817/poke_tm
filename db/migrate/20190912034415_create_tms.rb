class CreateTms < ActiveRecord::Migration[6.0]
  def change
    create_table :tms do |t|
      t.string :name
      t.string :type
      t.string :rarity

      t.timestamps
    end
  end
end
