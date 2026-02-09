{{ config(materialized='view') }}

with tb1 as (
    select 
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    from {{ source('source_table_name', 'raw_orders') }}
)

select * from tb1
