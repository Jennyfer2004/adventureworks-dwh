select
    {{ dbt_utils.generate_surrogate_key([
        "'aw_core'",
        "specialofferid"
    ]) }} as promotionid,
    *
from {{ source('silver', 'specialoffer') }}