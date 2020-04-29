select 
  o.id AS order_id
, o.user_id AS customer_id
, ROUND(p.amount/100,2) AS amount
from raw.jaffle_shop.orders o
left join raw.stripe.payment p
  on o.id = p."orderID"