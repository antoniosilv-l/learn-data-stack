with
dim_habilidades as (
    select
        skills_id,
        skills_name,
        skills_description
    from {{ ref('stg_dim_habilidades') }}
)
select
    *
from dim_habilidades
