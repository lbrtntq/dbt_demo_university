select
    semester_id,
    semester,
    year,
    start_date,
    end_date,
    current_timestamp() as loaded_at
from {{ source('raw_data','raw_semester') }}
