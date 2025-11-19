select
    faculty_id,
    first_name,
    last_name,
    department,
    hire_date,
    email,
    created_date,
    current_timestamp() as loaded_at
from {{ source('raw_data','raw_faculty') }}
