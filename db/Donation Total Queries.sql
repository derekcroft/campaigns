-- sum of fixed pledges by campaign
select 
c.id,
sum(fixed_p.amount) as fixed_total
from campaigns c
inner join pledges fixed_p
on fixed_p.campaign_id = c.id
and fixed_p.pledge_type = 'fixed'
group by c.id;

-- total penny pledges by campaign
select
c.id,
count(d.*) as num_donors
from campaigns c
inner join donors d
on d.campaign_id = c.id
inner join pledges penny_p
on penny_p.campaign_id = c.id
and penny_p.donor_id = d.id
and penny_p.pledge_type = 'penny'
group by c.id;

-- sum penny pledges by campaign
select
c.id, -- ,  penny_p.donor_id,
sum(least(0.01*(select count(*) from donors where campaign_id = c.id),penny_p.cap)) as pledge_amount
from campaigns c
inner join pledges penny_p
on penny_p.campaign_id = c.id
and penny_p.pledge_type = 'penny'
group by c.id;


