{{ config(materialized='table') }}


with employee_new_data as (
 select * from {{source('snowflake_employee_data','EMPLOYEEDETAILS')}}
),
final as (
    select emp_id,
    CONCAT(first_name,' ', middle_initial, ' ', last_name) as emp_name,
    gender,
    email,
    REPLACE(PHONE_NUMBER,'-','') AS PHONE_NUMBER,
    fathers_name,
    mothers_name,
    REPLACE(DATE_OF_BIRTH,'-','/') As DATE_OF_BIRTH,
    REPLACE(DATE_OF_JOINING,'-','/')  AS DATE_OF_JOINING,
    salary,
    city,
    state,
    zip,
    username,
    password 
    from employee_new_data  where EMAIL LIKE '%_@__%.__%'
)
select * from final
