select 
    artist.name as ARTIST_NAME,
    release_info.date_month as RELEASE_MONTH,
    count(distinct release.id) as NUM_RELEASES
from 
    artist
join 
    artist_credit_name on artist.id = artist_credit_name.artist
join 
    release on artist_credit_name.artist_credit = release.artist_credit
join 
    release_info on release.id = release_info.release
join 
    artist_type on artist.type = artist_type.id
where 
    artist.name like 'Elvis%' 
    and artist_type.name = 'Person' 
    and release_info.date_month is not null
group by 
    artist.name, release_info.date_month
order by 
    num_releases desc, 
    artist_name asc;
