with
int_pokemon_habilidades as (
    select
        pokemon_id,
        habilidade_id as skills_id
    from {{ source('silver_pokemons', 'pokemon_habilidades') }}
)
select
    *
from int_pokemon_habilidades
