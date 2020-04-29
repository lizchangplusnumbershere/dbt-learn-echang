WITH amounts AS (
SELECT 
  p."orderID" AS order_id
, SUM(ROUND(p.amount/100,2)) AS amount
FROM raw.stripe.payment p
GROUP BY 1
)
select 
  o.id AS order_id
, o.user_id AS customer_id
, o.order_date
, o.status
, a.amount
from raw.jaffle_shop.orders o
left join amounts a
  on o.id = a.order_id