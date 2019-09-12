class AddToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :user_id, :integer
    add_column :pokemons, :tm_id, :integer
  end
end
