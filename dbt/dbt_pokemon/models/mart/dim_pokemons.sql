with
dim_pokemons as (
    select
        pokemon_id,
        pokemon_name,
        height_value,
        weight_value
    from {{ ref('stg_dim_pokemons') }}
)
select
    *
from dim_pokemons
