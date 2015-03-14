select

r.field,
(
sum(
case when r.team_score>r.opponent_score and r.field='offense_home' then 1
     when r.team_score<r.opponent_score and r.field='defense_home' then 1
     when r.field='none' then 0.5
     else 0 end)::float/
count(*)
)::numeric(4,2) as naive,
count(*)
from ncaa.results r
join ncaa._schedule_factors t
  on (t.year,t.team_id)=(r.year,r.team_id)
join ncaa._schedule_factors o
  on (o.year,o.team_id)=(r.year,r.opponent_id)
join ncaa._factors f
  on (f.parameter,f.level)=('field',r.field)
where

TRUE

and r.pulled_id=r.team_id
and r.team_id < r.opponent_id

-- test March and April

--and not(r.field='none')

--and extract(month from r.game_date) in (3,4)

group by r.field;
--,r.field
--order by r.year,r.field;

