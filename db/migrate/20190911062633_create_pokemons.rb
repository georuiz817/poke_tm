class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :generation
      t.string :final_evolution

      t.timestamps
    end
  end
end
