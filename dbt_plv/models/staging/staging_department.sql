select
    department_id,
    department_name,
    faculty_head_id,
    current_timestamp() as loaded_at
from {{ source('raw_data','raw_department') }}
