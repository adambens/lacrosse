begin;

create temporary table ts (
       year					integer,
       year_id					integer,
--       division_id				integer,
       team_id					integer,
       team_name				text,
       jersey_number				text,
       player_name				text,
       class_year				text,
       gp					integer,
       gs					integer,
       g					integer,
       gs2					integer,
       goals					integer,
       assists					integer,
       points					integer,
       shots					text,
       shot_pct					float,
       sog					integer,
       sog_pct					float,
       gwg					integer,
       man_up_g					integer,
       man_down_g				integer,
       gb					text,
       turnovers				integer,
       caused_turnovers				integer,
       fo_won					integer,
       fo_taken					integer,
       fo_pct					float,
       pen 					integer,
       pen_time					text,
       ggp					integer,
       ggs					integer,
       g_min					text,
       goals_allowed				integer,
       gaa					text,
       saves 					integer,
       save_pct					float,
       rc    					integer,
       yc    					integer,
--       clears					integer,
--       att					integer,
--       clear_pct				float,
       primary key (year_id,team_id,player_name),
       unique (year,team_id,player_name)
);

copy ts from '/tmp/team_summaries.csv' with delimiter as E'\t' csv;

insert into ncaa_pbp.team_summaries
(
year,year_id,team_id,team_name,
jersey_number,player_name,class_year,
gp,gs,g,gs2,
goals,assists,points,
shots,shot_pct,sog,sog_pct,gwg,man_up_g,man_down_g,gb,
turnovers,caused_turnovers,fo_won,fo_taken,
pen,pen_time,ggp,ggs,g_min,goals_allowed,gaa,saves,save_pct,rc,yc,
clears,att,clear_pct)
(
select
year,year_id,team_id,team_name,
jersey_number,player_name,class_year,
gp,gs,g,gs2,
goals,assists,points,
shots,shot_pct,sog,sog_pct,gwg,man_up_g,man_down_g,gb,
turnovers,caused_turnovers,fo_won,fo_taken,
pen,pen_time,ggp,ggs,g_min,goals_allowed,gaa,saves,save_pct,rc,yc,
NULL as clears,
NULL as att,
NULL as clear_pct
from ts
);

commit;
