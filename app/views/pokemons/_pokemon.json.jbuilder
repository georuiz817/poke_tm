json.extract! pokemon, :id, :name, :generation, :final_evolution, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
