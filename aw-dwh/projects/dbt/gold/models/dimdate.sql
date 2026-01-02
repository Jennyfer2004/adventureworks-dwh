with dates as (
    select 
        sequence(
            date('2004-01-01'),
            date('2015-12-31'),
            interval '1' day
        ) as date_array
),

expanded as (
    select 
        d as date_value
    from dates
    cross join unnest(date_array) as t(d)
)
    select
        {{ dbt_utils.generate_surrogate_key([
            "date_value"
        ]) }} as dateid,
        date_value as date,
        date_format(date_value, '%W')                     as dayofweekname,
        extract(dow from date_value) + 1        as dayofweek,       -- 1–7
        extract(day from date_value)            as dayofmonth,
        extract(doy from date_value)            as dayofyear,
        extract(week from date_value)           as weekofyear,
        extract(month from date_value)          as monthofyear,
        date_format(date_value, '%M') as monthofyearname,
        extract(quarter from date_value)        as calendarquater,
        extract(year from date_value)           as calendaryear,
        case
            when extract(month from date_value) <= 6 then 1
            else 2
        end as calendarsemester,
        case
            when extract(month from date_value) >= 7 then extract(year from date_value) + 1
            else extract(year from date_value)
        end as fiscalyear,
        case
            when extract(month from date_value) between 7 and 9  then 1
            when extract(month from date_value) between 10 and 12 then 2
            when extract(month from date_value) between 1 and 3  then 3
            else 4
        end as fiscalquater,
        case
            when extract(month from date_value) between 7 and 12 then 1
            else 2
        end as fiscalsemester
    from expanded
    order by date_value