select
    course_id,
    course_name,
    department_id,
    credits,
    current_timestamp() as loaded_at
from {{ source('raw_data','raw_course') }}
