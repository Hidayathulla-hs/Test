{{ config(
    materialized = "incremental",
    incremental_strategy = "append"
) }}

SELECT *
FROM {{ source('source_table_name', 'raw_orders') }}

{% if is_incremental() %}
WHERE updated_at > (SELECT MAX(updated_at) FROM {{ this }})
{% endif %}
