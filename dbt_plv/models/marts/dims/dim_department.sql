with dedup_query as (
  select
    *, 
    row_number() over(partition by department_id order by created_date desc) as dedup_id
  from {{ ref('staging_department') }}
)

select 
    department_id,
    department_name,
    faculty_head_id,
    created_date,
    loaded_at
from
  dedup_query
where 
  dedup_id = 1