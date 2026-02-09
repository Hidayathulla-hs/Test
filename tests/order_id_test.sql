-- tests/order_id_test.sql

select
  order_id,
  count(*) as duplicate_count
from {{ ref('orders') }}
group by order_id
having count(*) > 1
