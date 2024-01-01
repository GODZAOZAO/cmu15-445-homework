select
    work_type as WORK_TYPE,
    work_name as WORK_NAME,
    comment_length as COMMENT_LENGTH,
    comment as COMMENT
from (
    select
        wt.name as work_type,
        w.name as work_name,
        length(w.comment) as comment_length,
        w.comment as comment,
        rank() over (partition by wt.id order by length(w.comment) desc) as rnk
    from
        work_type wt
    join
        work w on w.type = wt.id
    where
        length(w.comment) > 0
) ranked
where
    rnk = 1
order by
    work_type asc,
    work_name asc;
