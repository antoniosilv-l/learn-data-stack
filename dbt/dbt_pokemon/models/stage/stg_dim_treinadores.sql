with
stg_dim_treinadores as (
    select
        id as trainers_id,
        nome as trainers_name,
        cidade as city_name
    from {{ source('silver_pokemons', 'treinadores') }}
)
select
    *
from stg_dim_treinadores
