with releases_by_language_and_decade as (
    select 
        l.name as language,
        sum(case when ri.date_year between 1950 and 1959 then 1 else 0 end) as num_releases_in_1950s,
        sum(case when ri.date_year between 2010 and 2019 then 1 else 0 end) as num_releases_in_2010s
    from release r
    join release_info ri on r.id = ri.release
    join language l on r.language = l.id
    group by l.name
),
total_releases_by_decade as (
    select 
        sum(case when ri.date_year between 1950 and 1959 then 1 else 0 end) as total_releases_in_1950s,
        sum(case when ri.date_year between 2010 and 2019 then 1 else 0 end) as total_releases_in_2010s
    from release r
    join release_info ri on r.id = ri.release
)
select 
    r.language as LANGUAGE,
    r.num_releases_in_1950s as NUM_RELEASES_IN_1950S,
    r.num_releases_in_2010s as NUM_RELEASES_IN_2010s,
    round((cast(r.num_releases_in_2010s as float) / t.total_releases_in_2010s) - 
          (cast(r.num_releases_in_1950s as float) / t.total_releases_in_1950s), 3) as INCREASE
from releases_by_language_and_decade r
cross join 
    total_releases_by_decade t
where 
    (cast(r.num_releases_in_2010s as float) / t.total_releases_in_2010s) >
    (cast(r.num_releases_in_1950s as float) / t.total_releases_in_1950s)
order by 
    increase desc;
