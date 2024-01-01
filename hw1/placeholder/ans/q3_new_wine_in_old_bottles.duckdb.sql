select 
    release.name as RELEASE_NAME, 
    artist_credit.name as ARTIST_NAME, 
    release_info.date_year as RELEASE_YEAR
from
    release
join
    release_info on release_info.release = release.id
join
    medium on release.id = medium.release
join
    medium_format on medium.format = medium_format.id
join
    artist_credit on artist_credit.id = release.artist_credit
where
    medium_format.name = 'Cassette'
order by
    release_info.date_year desc,
    release_info.date_month desc,
    release_info.date_day desc,
    release.name,
    artist_credit.name 
limit 10;
