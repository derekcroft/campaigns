-- sum of fixed pledges by campaign
select 
c.id,
sum(fixed_p.amount) as fixed_total
from campaigns c
inner join pledges fixed_p
on fixed_p.campaign_id = c.id
and fixed_p.pledge_type = 'fixed'
group by c.id;

-- sum penny pledges by campaign
select
c.id,
sum(
  least(
    0.01*(
      select count(*) 
      from donors d
      where campaign_id = c.id
    ),
    penny_p.cap
  )
) as penny_total
from campaigns c
inner join pledges penny_p
on penny_p.campaign_id = c.id
and penny_p.pledge_type = 'penny'
group by c.id;


