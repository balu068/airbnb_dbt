SELECT
    HOST_ID,
    COALESCE(HOST_NAME, 'Anonymous') AS HOST_NAME,
    IS_SUPERHOST,
    CREATED_AT,
    UPDATED_AT
FROM {{ ref('src_hosts') }}