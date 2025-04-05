with
dim_treinadores as (
    select
        trainers_id,
        trainers_name,
        city_name
    from {{ ref('dim_treinadores') }}
),
dim_pokemons as (
    select
        pokemon_id,
        pokemon_name,
        height_value,
        weight_value
    from {{ ref('dim_pokemons') }}
),
dim_tipos as (
    select
        type_id,
        type_name
    from {{ ref('dim_tipos') }}
),
dim_habilidades as (
    select
        skills_id,
        skills_name,
        skills_description
    from {{ ref('dim_habilidades') }}
),
int_equipe as (
    select
        trainers_id,
        pokemon_id
    from {{ ref('int_equipes') }}
),
int_pokemon_habilidades as (
    select
        skills_id,
        pokemon_id
    from {{ ref('int_pokemon_habilidades') }}
),
int_pokemon_tipos as (
    select
        type_id,
        pokemon_id
    from {{ ref('int_pokemon_tipos') }}
),
fct_pokemon as (
    select
        tre.trainers_id,
        ieq.pokemon_id,
        ihbl.skills_id,
        itps.type_id,
        current_date as dataops_logical_date
    from dim_treinadores tre
    left join int_equipe ieq on tre.trainers_id = ieq.trainers_id
    left join dim_pokemons pok on ieq.pokemon_id = pok.pokemon_id
    left join int_pokemon_habilidades ihbl on ihbl.pokemon_id = pok.pokemon_id
    left join dim_habilidades hbl on hbl.skills_id = ihbl.skills_id
    left join int_pokemon_tipos itps on pok.pokemon_id = itps.pokemon_id
    left join dim_tipos tps on tps.type_id = itps.type_id
)
select
    *
from fct_pokemon
