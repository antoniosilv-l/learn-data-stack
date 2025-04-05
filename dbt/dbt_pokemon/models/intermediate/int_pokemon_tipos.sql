with
int_pokemon_tipos as (
    select
        pokemon_id,
        tipo_id as type_id
    from {{ source('silver_pokemons', 'pokemon_tipos') }}
)
select
    *
from int_pokemon_tipos
