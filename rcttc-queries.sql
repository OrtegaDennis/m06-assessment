use tiny_theaters;

-- Find all performances in the last quarter of 2021 (Oct. 1, 2021 - Dec. 31 2021)
select s.show,
sd.show_date
from theater_show_date tsd
inner join show_date sd on sd.show_date_id = tsd.show_date_id
inner join `show` s on s.show_id = tsd.show_id
where sd.show_date >= '2021-10-01' and sd.show_date <= '2021-12-31';

-- List customers without duplication.
select distinct customer_id,
concat(customer_first, ' ', customer_last) as customer_name
 from customer;
 
 -- Find all customers without a .com email address.
 select concat(customer_first, ' ', customer_last) as customer_name,
 customer_email
 from customer
 where customer_email not like '%com';
 
 -- Find the three cheapest shows.
 select s.show,
 tds.price,
 sd.show_date
 from theater_show_date tds
 inner join `show` s on s.show_id = tds.show_id
 inner join show_date sd on sd.show_date_id = tds.show_date_id
 order by price asc
 limit 4;
 
--  List customers and the show they're attending with no duplication
select distinct t.customer_id,
concat(c.customer_first, ' ', c.customer_last) as customer_name,
s.show
from ticket t
left join customer c on c.customer_id = t.customer_id
left join show_date sd on sd.show_date_id = t.show_date_id
left join theater th on th.theater_id = t.ticket_id
left join theater_show_date tsd on tsd.theater_id = t.theater_id and tsd.show_date_id = sd.show_date_id
left join `show` s on s.show_id = tsd.show_id
order by t.customer_id;
 
 -- Find customers without an address.
select customer_first,
customer_last,
customer_address
from customer
where customer_address = '' or customer_address is null;
