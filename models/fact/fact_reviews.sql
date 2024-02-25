{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
    )
}}
SELECT 
{{dbt_utils.generate_surrogate_key(['listing_id','reviewer_name','review_date','review_text'])}} as review_id,
*
 FROM {{ ref('src_reviews') }}
{% if is_incremental() %}
  where REVIEW_DATE >= coalesce((select max(REVIEW_DATE) from {{ this }}), '1900-01-01')
{% endif %}