select 
    a.name as artist_name,
    lr.release_name,
    lr.release_year
from artist a
join lateral (
    select 
        r.name as release_name, 
        ri.date_year as release_year
    from 
        artist_credit ac
    join 
        artist_credit_name acn on ac.id = acn.artist_credit
    join 
        release r on ac.id = r.artist_credit
    join 
        release_info ri on r.id = ri.release
    where 
        acn.artist = a.id
        and ac.artist_count = 4
        and ri.date_year is not null
    order by 
        ri.date_year desc, 
        ri.date_month desc, 
        ri.date_day desc
) lr on true
where a.gender = 1 and a.begin_date_year = 1991
order by 
    a.name, 
    lr.release_year desc
    limit 3;
