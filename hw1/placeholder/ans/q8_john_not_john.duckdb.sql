select 
    artist.name as ARTIST_NAME,
    count(artist_alias.name) as NUM_ALIASES,
    group_concat(artist_alias.name, ', ') as COMMA_SEPARATED_LIST_OF_ALIASES
from 
    artist
left join 
    artist_alias on artist.id = artist_alias.artist
where 
    lower(artist.name) like '%john'
    and artist.id not in (
        select 
            artist 
        from 
            artist_alias 
        where
            lower(artist_alias.name) like '%john%'
    )
group by 
    artist.id, artist.name
having 
    count(artist_alias.name) > 0
order by 
    artist.name;
