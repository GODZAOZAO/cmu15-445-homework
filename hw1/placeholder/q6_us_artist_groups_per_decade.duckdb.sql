select 
    concat(cast((floor(artist.begin_date_year / 10) * 10) as int), 's') as DECADE, 
    count(*) as NUM_ARTIST_GROUP
from 
    artist
join 
    area on artist.area = area.id
join 
    artist_type on artist.type = artist_type.id
where 
    artist_type.name = 'Group' 
    and area.name = 'United States' 
    and artist.begin_date_year is not null
    and (floor(artist.begin_date_year / 10) * 10) >= 1900
group by 
    decade
order by 
    decade;

