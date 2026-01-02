with customer as (
    select * from {{ source('silver', 'customer') }}
),

person as (
    select * from {{ source('silver', 'person') }}
),

store as (
    select * from {{ source('silver', 'store') }}
),

address as (
    select * from {{ source('silver', 'address') }}
),

stateprovince as (
    select * from {{ source('silver', 'stateprovince') }}
),

countryregion as (
    select * from {{ source('silver', 'countryregion') }}
),

reviews as (
    select * from {{ source('silver', 'reviews') }}
),

customer_reviews_agg as (
    select
        userid,
        avg(rating) as avgeragereviews
    from reviews
    group by userid
),

customer_base as (
    select
        {{ dbt_utils.generate_surrogate_key([
        "'aw_core'",
        "p.businessentityid"
    ]) }} as customerid,
        c.customerid as altcustomerid,
        -- c.customerid,
        p.title,
        p.emailpromotion,
        p.middlename,
        coalesce(p.firstname, s.name) as nameunique,
        coalesce(p.lastname, '') as lastname,
        coalesce(p.firstname || ' ' || p.lastname, s.name) as totalname,
        c.accountnumber,
        case
            when c.personid is not null then 'Persona'
            when c.storeid is not null then 'Tienda'
            else 'Desconocido'
        end as persontype,
        a.city,
        sp.name as province,
        cr.name as region,

        cra.avgeragereviews,

         ROW_NUMBER() OVER (
            PARTITION BY c.customerid 
            ORDER BY 
                -- Prioriza por tipo de dirección
                CASE WHEN bea.addresstypeid = 1 THEN 1  -- Casa
                     WHEN bea.addresstypeid = 2 THEN 2  -- Oficina
                     ELSE 3 END
                -- a.modifieddate DESC  -- O la más reciente
        ) as rn
    from customer c
    inner join person p on p.businessentityid = c.personid
    left join store s on c.storeid = s.businessentityid

    left join {{ source('silver', 'businessentityaddress') }} bea on c.customerid = bea.businessentityid

    left join address a on bea.addressid = a.addressid
    left join stateprovince sp on a.stateprovinceid = sp.stateprovinceid
    left join countryregion cr on sp.countryregioncode = cr.countryregioncode
    left join customer_reviews_agg cra on c.personid = cra.userid
),

customer_base_deduped as (
    select
        customerid,
        altcustomerid,
        title,
        emailpromotion,
        middlename,
        nameunique,
        lastname,
        totalname,
        accountnumber,
        persontype,
        city,
        province,
        region,
        avgeragereviews
    from customer_base
    where rn = 1  -- Solo la primera fila por customerid
)

select
    {{ dbt_utils.generate_surrogate_key(['customerid']) }} as cliente_sk,
    *
from customer_base_deduped