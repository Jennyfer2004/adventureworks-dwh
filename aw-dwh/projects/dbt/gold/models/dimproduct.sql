with product as (
    select * 
    from {{ source('silver',  'product') }}
),
subcategory as (
    select * 
    from {{ source('silver', 'productsubcategory') }}
),
category as (
    select * 
    from {{ source('silver', 'productcategory') }}
),
productmodel as (
    select * 
    from {{ source('silver', 'productmodel') }}
)
select 
    {{ dbt_utils.generate_surrogate_key([
        "'aw_core'",
        "p.productnumber"
    ]) }} as productid,
    p.productid as altproductid,
    p.name,
    p.productnumber,
    sc.name as subcategory,
    c.name  as category,
    p.sizeunitmeasurecode,
    p.weightunitmeasurecode,
    p.color,
    p.safetystocklevel,
    p.reorderpoint,
    coalesce(p.standardcost, 0) as standardcost,
    coalesce(p.listprice, 0) as listprice,
    coalesce(p.weight, 0) as weight,
    p.size,
    p.daystomanufacture,
    p.productline,
    p.class,
    p.style,
    pm.name as productmodel,
    p.sellstartdate,
    p.sellenddate,
    p.discontinueddate
from product p
left join subcategory sc 
    on p.productsubcategoryid = sc.productsubcategoryid
left join category c 
    on sc.productcategoryid = c.productcategoryid
left join productmodel pm 
    on p.productmodelid = pm.productmodelid
