SELECT
    L.LISTING_ID,
    L.LISTING_NAME,
    L.ROOM_TYPE,
    L.MINIMUM_NIGHTS,
    L.PRICE,
    L.HOST_ID,
    H.HOST_NAME,
    H.IS_SUPERHOST AS HOST_IS_SUPERHOST,
    L.CREATED_AT,
    L.UPDATED_AT AS UPDATED_AT
FROM {{ ref('dim_listings_cleansed') }} L
LEFT JOIN {{ ref('dim_hosts_cleansed') }} H ON H.HOST_ID = L.HOST_ID