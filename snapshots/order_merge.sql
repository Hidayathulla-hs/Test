{{ config(
    materialized='incremental',
    unique_key='id',
    incremental_strategy='merge'
) }}

select *
from {{ source('source_table_name', 'raw_order') }}
