{{ config(materialized='table') }}

with emp_cred AS(
    select * from {{ref('employee_credentials')}}
),
emp_pers AS(
    select * from {{ref('employee_personal_details')}}
),

final as (
    select emp_pers.employee_id,emp_pers.emp_name,emp_pers.gender,emp_pers.date_of_birth from emp_pers
    left join emp_cred on
    emp_pers.employee_id = emp_cred.emp_id
)
 
select * from final