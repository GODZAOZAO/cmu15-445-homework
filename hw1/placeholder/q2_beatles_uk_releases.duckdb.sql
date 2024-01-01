select
    release.name as RELEASE_NAME,
    release_info.date_year as RELEASE_YEAR
from
    release
join
    release_info on release.id = release_info.release
join
    medium on release.id = medium.release
join
    medium_format on medium.format = medium_format.id
join
    artist_credit on artist_credit.id = release.artist_credit
join
    artist_credit_name on artist_credit_name.artist_credit = artist_credit.id
join
    artist on artist.id = artist_credit_name.artist
where
    artist.name = 'The Beatles'
    and medium_format.name = '12" Vinyl'
    and cast(release_info.date_year || '-' || printf('%02d', release_info.date_month) || '-' || printf('%02d', release_info.date_day) as date) 
    <= cast(artist.end_date_year || '-' || printf('%02d', artist.end_date_month) || '-' || printf('%02d', artist.end_date_day) as date)
group by
    release.name,
    release_info.date_year
order by
    min(release_info.date_year),
    min(release_info.date_month),
    min(release_info.date_day),
    release.name;
