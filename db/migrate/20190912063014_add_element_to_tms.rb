class AddElementToTms < ActiveRecord::Migration[6.0]
  def change
    add_column :tms, :element, :string
  end
end
