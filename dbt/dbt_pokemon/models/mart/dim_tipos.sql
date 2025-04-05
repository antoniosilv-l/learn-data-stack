with
dim_tipos as (
    select
        type_id,
        type_name
    from {{ ref('stg_dim_tipos') }}
)
select
    *
from dim_tipos
