with
stg_dim_pokemons as (
    select
        id as pokemon_id,
        nome as pokemon_name,
        altura as height_value,
        peso as weight_value
    from {{ source('silver_pokemons', 'pokemons') }}
)
select
    *
from stg_dim_pokemons
