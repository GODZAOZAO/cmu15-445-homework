select distinct 
    a.name
from 
    artist a
join 
    artist_credit_name acn on a.id = acn.artist
join 
    artist_credit_name acn2 on acn.artist_credit = acn2.artist_credit
join 
    artist a2 on acn2.artist = a2.id
where 
    a2.name = 'Pittsburgh Symphony Orchestra'
    and a.name != 'Pittsburgh Symphony Orchestra'
order by 
    a.name;

