select
    semester_id,
    semester,
    year,
    concat(semester, ' ' , year) as period_label
from 
    {{ ref('staging_semester')}}