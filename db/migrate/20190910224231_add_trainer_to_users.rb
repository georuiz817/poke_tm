class AddTrainerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :trainer, :string
  end
end
