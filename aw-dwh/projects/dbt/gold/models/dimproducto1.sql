with product as (
    select * from {{ source('silver', 'product') }}
),

productlistpricehistory as (
    select * from {{ source('silver', 'productlistpricehistory') }}
),

productcosthistory as (
    select * from {{ source('silver', 'productcosthistory') }}
),

productsubcategory as (
    select * from {{ source('silver', 'productsubcategory') }}
),

productcategory as (
    select * from {{ source('silver', 'productcategory') }}
),

productmodel as (
    select * from {{ source('silver', 'productmodel') }}
)

-- productbase as (
select
        p.productid as altproductid,
        p.name,
        p.productnumber,
        c.name as category,
        sc.name as subcategory,
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
        p.discontinueddate,
        -- Usamos COALESCE para manejar fechas nulas y estandarizarlas
        -- coalesce(plh.startdate, '1900-01-01'::date) as precioinicio,
        -- coalesce(plh.enddate, '9999-12-31'::date) as preciofin,
        plh.listprice as listpricehistory,
        -- coalesce(pch.startdate, '1900-01-01'::date) as costoinicio,
        -- coalesce(pch.enddate, '9999-12-31'::date) as costofin,
        ch.standardcost as standardcosthistory
from product p
left join productlistpricehistory plh on p.productid = plh.productid

    -- left join productlistpricehistory plh on p.productid = plh.productid
left join productcosthistory ch on p.productid = ch.productid
left join productsubcategory sc on p.productsubcategoryid = sc.productsubcategoryid
left join productcategory c on sc.productcategoryid = c.productcategoryid
left join productmodel pm on p.productmodelid = pm.productmodelid

-- ),

-- CTE para detectar los cambios usando funciones de ventana
-- changesdetected as (
--     select
--         *,
--         lag(preciolista) over (partition by productid order by precioinicio) as precioanterior,
--         lag(costoestandar) over (partition by productid order by costoinicio) as costoanterior
--     from productbase
-- ),

-- scdrows as (
--     select
--         productid,
--         nombreproducto,
--         productnumber,
--         categoria,
--         subcategoria,
--         modelo,
--         color,
--         size,
--         preciolista,
--         costoestandar,
--         least(precioinicio, costoinicio) as fechainiciovigencia,
--         least(preciofin, costofin) as fechafinvigencia,
--         case when least(preciofin, costofin) = '9999-12-31'::date then true else false end as esregistroactual
--     from changesdetected
--     where
--         -- Nos quedamos con la primera fila o con las filas donde hay un cambio
--         precioanterior is null or
--         costoanterior is null or
--         preciolista <> precioanterior or
--         costoestandar <> costoanterior
-- )

