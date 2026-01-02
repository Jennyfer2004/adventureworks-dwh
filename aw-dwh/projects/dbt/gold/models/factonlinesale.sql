with soh as (
    select *
    from {{ source('silver', 'salesorderheader') }}
),

sod as (
    select *
    from {{ source('silver', 'salesorderdetail') }}
),

ddorder as (
    select *
    from {{ ref('dimdate') }}
),

dddue as (
    select *
    from {{ ref('dimdate') }}
),

ddship as (
    select *
    from {{ ref('dimdate') }}
),

dc as (
    select *
    from {{ ref('dimcustomer') }}
),

st as (
    select *
    from {{ ref('dimsalesterritory') }}
),

sta as (
    select *
    from {{ source('silver', 'address') }}
),

stsp as (
    select *
    from {{ source('silver', 'stateprovince') }}
),

stg as (
    select *
    from {{ ref('dimgeography') }}
),

bta as (
    select *
    from {{ source('silver', 'address') }}
),

btsp as (
    select *
    from {{ source('silver', 'stateprovince') }}
),

btg as (
    select *
    from {{ ref('dimgeography') }}
),

dpr as (
    select *
    from {{ ref('dimpromotion') }}
),

dp as (
    select *
    from {{ ref('dimproduct') }}
),

sm as (
    select *
    from {{ source('silver', 'shipmethod') }}
)

select 
    {{ dbt_utils.generate_surrogate_key([
        "soh.salesordernumber",
        " sod.salesorderdetailid"
    ]) }} as onlinesaleid,
    soh.salesordernumber,
    sod.salesorderdetailid,

    ddorder.dateid as orderdateid,
    dddue.dateid   as duedateid,
    ddship.dateid  as shipdateid,

    dc.customerid,
    st.salesterritoryid,
    stg.geographyid   as shiptogeographyid,
    btg.geographyid   as billtogeographyid,

    dpr.promotionid,
    dp.productid,

    sod.orderqty,
    dp.standardcost,
    dp.standardcost * sod.orderqty                                 as costamount,

    sod.unitprice,
    sod.unitpricediscount                                           as unitpricediscountpct,
    sod.unitpricediscount * sod.unitprice                           as unitpricediscount,
    sod.unitprice * sod.orderqty                                    as priceamount,
    sod.unitprice * sod.orderqty * sod.unitpricediscount            as discountamount,

    (sod.unitprice * sod.orderqty - sod.unitprice * sod.orderqty * sod.unitpricediscount) as salesamount,

    cast(0.08 as double)                                            as taxrate,

    (sod.unitprice * sod.orderqty - sod.unitprice * sod.orderqty * sod.unitpricediscount)
        * 0.08                                                       as taxamount,

    case
        when dp.weightunitmeasurecode = 'LB'
            then greatest(sm.shiprate * dp.weight, sm.shipbase)
        when dp.weightunitmeasurecode = 'G'
            then greatest(sm.shiprate * dp.weight * 0.00220462, sm.shipbase)
        else sm.shipbase
    end                                                              as freight

from soh
inner join sod on soh.salesorderid = sod.salesorderid

inner join ddorder on date(soh.orderdate) = date(ddorder.date)
inner join dddue   on date(soh.duedate)  = date(dddue.date)
inner join ddship  on date(soh.shipdate) = date(ddship.date)

inner join dc on dc.altcustomerid = soh.customerid 
inner join st on st.altsalesterritoryid = soh.territoryid

inner join sta  on sta.addressid = soh.shiptoaddressid 
inner join stsp on stsp.stateprovinceid = sta.stateprovinceid
inner join stg  on stg.city = sta.city
               and stg.stateprovincecode = stsp.stateprovincecode
               and stg.postalcode = sta.postalcode
               and stg.countrycode = stsp.countryregioncode

inner join bta  on bta.addressid = soh.billtoaddressid 
inner join btsp on btsp.stateprovinceid = bta.stateprovinceid
inner join btg  on btg.city = bta.city
               and btg.stateprovincecode = btsp.stateprovincecode
               and btg.postalcode = bta.postalcode
               and btg.countrycode = btsp.countryregioncode

inner join dpr on dpr.specialofferid = sod.specialofferid 
inner join dp  on dp.altproductid     = sod.productid 
inner join sm  on sm.shipmethodid     = soh.shipmethodid 

where soh.onlineorderflag = true
