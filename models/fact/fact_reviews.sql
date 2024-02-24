{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}
SELECT * FROM {{ ref('src_reviews') }}
{% if is_incremental() %}
  where REVIEW_DATE >= coalesce((select max(REVIEW_DATE) from {{ this }}), '1900-01-01')
{% endif %}