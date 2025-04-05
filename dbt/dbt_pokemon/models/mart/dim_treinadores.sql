with
dim_treinadores as (
    select
        trainers_id,
        trainers_name,
        city_name
    from {{ ref('stg_dim_treinadores') }}
)
select
    *
from dim_treinadores
