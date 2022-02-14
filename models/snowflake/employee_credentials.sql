{{ config(materialized='table') }}


with emp_creds AS(
    select * from {{ref('employee_details_new')}}
),
final as(
    select emp_id,username,password from emp_creds
)

{{ log("@@@logmessage",True)}}
select * from final