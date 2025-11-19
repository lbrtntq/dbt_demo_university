select 
    assignment_id,
    faculty_id,
    course_id,
    semester,
    year,
    created_date,
    current_timestamp() as loaded_at
from 
    {{ source('raw_data', 'raw_teaching_assignments')}}