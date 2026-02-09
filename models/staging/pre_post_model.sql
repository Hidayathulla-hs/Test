{{ config(
    materialized = "incremental",
    incremental_strategy = "append",
    pre_hook = "TRUNCATE TABLE {{ this }}"
) }}

SELECT *
FROM {{ source('source_table_name','orders') }}
