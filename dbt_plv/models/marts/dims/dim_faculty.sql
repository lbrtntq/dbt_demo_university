with dedup_query as (
  select
    *, 
    row_number() over(partition by faculty_id order by created_date desc) as dedup_id
  from {{ ref('staging_faculty') }}
)

select 
  faculty_id,
  first_name,
  last_name,
  department,
  hire_date,
  email,
  loaded_at,
  created_date
from
  dedup_query
where 
  dedup_id = 1