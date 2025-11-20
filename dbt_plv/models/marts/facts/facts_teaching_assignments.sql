
    {{ config(
        materialized='table',
        schema='marts'
    ) }}

with stg as (
  select
    assignment_id,
    faculty_id,
    course_id,
    semester,
    year,
    created_date,
    current_timestamp() as loaded_at
  from {{ ref('staging_teaching_assignments') }}
),

faculty_map as (
  select faculty_id, first_name, last_name, email from {{ ref('dim_faculty') }}
),

course_map as (
  select course_id, course_name, department_id, credits from {{ ref('dim_course') }}
),

time_map as (
  select semester_id, semester, year from {{ ref('dim_time') }}
),

department_map as (
  -- get current department_sk for assign time: join dim_department where is_current = true
  -- select department_sk, department_id from {{ ref('dim_department') }} where is_current = true

  select department_id, department_name from {{ ref('dim_department') }}
)

select
  stg.assignment_id,
  stg.semester,
  stg.faculty_id,
  concat(f.first_name, ' ', f.last_name) as full_name,
  f.email,
  c.course_name,
  c.credits,
  d.department_name,
  current_timestamp() as created_at
from stg
left join faculty_map f on stg.faculty_id = f.faculty_id
left join course_map c on stg.course_id = c.course_id
left join department_map d on c.department_id = d.department_id
