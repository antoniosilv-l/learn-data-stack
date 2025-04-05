with
stg_dim_habilidades as (
    select
        id as skills_id,
        nome as skills_name,
        descricao as skills_description
    from {{ source('silver_pokemons', 'habilidades') }}
)
select
    *
from stg_dim_habilidades
