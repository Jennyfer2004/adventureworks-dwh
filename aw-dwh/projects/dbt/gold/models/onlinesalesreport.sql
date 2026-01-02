with dd as (
    select *
    from {{ ref('dimdate') }}
),
dp as (
    select *
    from {{ ref('dimproduct') }}
),
dg as (
    select *
    from {{ ref('dimgeography') }}
),
dst as (
    select *
    from {{ ref('dimsalesterritory') }}
),
fos as (
    select *
    from {{ ref('factonlinesale') }}
)
select
	dd."date",
	dp.category,
	dp.subcategory,
	dg.countrycode,
	dg.countryname,
	dst.groupname,
	sum(fos.orderqty) as totalunits,
	sum(fos.costamount) as totalcost,
	sum(fos.salesamount) as totalsales,
	sum(fos.taxamount) as totaltaxes,
	sum(fos.freight) as totalfreight,
    sum(fos.salesamount) - sum(fos.costamount) as totalprofit
from fos
inner join  dp on fos.productid  = dp.productid 
inner join  dd on fos.orderdateid = dd.dateid 
inner join  dg on fos.billtogeographyid = dg.geographyid 
inner join  dst on fos.salesterritoryid = dst.salesterritoryid 
group by
	dd."date",
	dp.category,
	dp.subcategory,
	dg.countrycode,
	dg.countryname,
	dst.groupname 