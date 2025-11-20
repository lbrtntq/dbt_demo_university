select
  row_number() over (order by course_id) as course_sk,
  course_id,
  course_name,
  department_id,
  credits,
  current_timestamp() as updated_at
from {{ ref('staging_course') }}