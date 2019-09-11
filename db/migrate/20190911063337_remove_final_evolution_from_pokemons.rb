class RemoveFinalEvolutionFromPokemons < ActiveRecord::Migration[6.0]
  def change

    remove_column :pokemons, :final_evolution, :string
  end
end
