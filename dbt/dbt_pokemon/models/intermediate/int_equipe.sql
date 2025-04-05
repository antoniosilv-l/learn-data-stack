with
int_equipe as (
    select
        treinador_id as trainers_id,
        pokemon_id
    from {{ source('silver_pokemons', 'equipes') }}
)
select
    *
from int_equipe
