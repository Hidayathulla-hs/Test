{{ config(
    materialized = "incremental",
    incremental_strategy = "append",
    pre_hook = "TRUNCATE TABLE {{ this }}"
) }}
WITH source_data AS (

    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY id
               ORDER BY order_date DESC
           ) AS rn
    FROM {{ source('source_table_name','orders') }}

)

SELECT *
FROM source_data
WHERE rn = 1

{% if is_incremental() %}
AND order_date > (SELECT MAX(order_date) FROM {{ this }})
{% endif %}
