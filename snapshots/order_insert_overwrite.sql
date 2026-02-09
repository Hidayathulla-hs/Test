{{ config(
    materialized='incremental',
    incremental_strategy='insert_overwrite'
) }}

select *
from {{ source('source_table_name', 'raw_customerdata') }}
