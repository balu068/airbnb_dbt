{{
  config(
    materialized = 'table',
    )
}}

SELECT
    F.*,
    CASE WHEN FM.FULL_MOON_DATE IS NULL THEN 'not full moon' ELSE 'full moon' END AS IS_FULL_MOON
FROM {{ ref('fact_reviews') }} F
LEFT JOIN {{ ref('seed_full_moon_dates') }} FM ON F.REVIEW_DATE = FM.FULL_MOON_DATE + INTEGER '1'