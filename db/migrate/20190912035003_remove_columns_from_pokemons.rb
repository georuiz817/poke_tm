class RemoveColumnsFromPokemons < ActiveRecord::Migration[6.0]
  def change

    remove_column :pokemons, :type, :string

    remove_column :pokemons, :generation, :integer
  end
end
