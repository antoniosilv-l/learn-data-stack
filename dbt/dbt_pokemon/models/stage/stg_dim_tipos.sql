with
stg_dim_tipos as (
    select
        id as type_id,
        nome as type_name
    from {{ source('silver_pokemons', 'tipos') }}
)
select
    *
from stg_dim_tipos
