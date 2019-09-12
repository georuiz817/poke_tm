class RemoveColumnFromTms < ActiveRecord::Migration[6.0]
  def change

    remove_column :tms, :type, :string
  end
end
