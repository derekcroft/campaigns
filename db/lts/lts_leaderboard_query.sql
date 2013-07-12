select t.name, t.charity, t.sport,
count(p.id) num_donors,
sum(p.cap) amount_raised
from teams t
inner join pledges p
on t.id = p.team_id
--where t.sport = 'Kickball'
group by t.name, t.charity, t.sport
order by num_donors desc
limit 10;