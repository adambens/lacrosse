begin;

drop table if exists ncaa_pbp.team_summaries_hitting;

create table ncaa_pbp.team_summaries_hitting (
       year					integer,
       year_id					integer,
--       division_id				integer,
       team_id					integer,
       team_name				text,
       jersey_number				text,
       player_name				text,
       class_year				text,
       position					text,
       gp					integer,
       gs					integer,
       g					integer,
       ba					float,
       obp					float,
       slg					float,
       ab					text,
       r					integer,
       h					integer,
       d					integer,
       t					integer,
       tb					text,
       hr					integer,
       rbi					integer,
       bb					integer,
       hbp					integer,
       sf					integer,
       sh					integer,
       k					integer,
       dp					integer,
       sb					integer,
       cs					integer,
       picked					integer,
       primary key (year_id,team_id,player_name),
       unique (year,team_id,player_name)
);

copy ncaa_pbp.team_summaries_hitting from '/tmp/team_summaries.csv' with delimiter as E'\t' csv;

commit;
