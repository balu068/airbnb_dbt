{% snapshot scd_raw_listings %}

{{
   config(
       unique_key='id',
        target_schema = 'dw',
       strategy='timestamp',
       updated_at='updated_at',
   )
}}
SELECT * FROM {{ source('airbnb', 'listings') }}

{% endsnapshot %}