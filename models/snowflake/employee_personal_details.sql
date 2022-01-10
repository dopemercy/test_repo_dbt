{{ config(materialized='table') }}

with employees AS(
    select * from {{ref('employee_details_new')}}
),

final as (
    select emp_id as employee_id,emp_name,
    gender,date_of_birth,date_of_joining from employees
)

select * from final