SELECT
  user_pseudo_id,
  TIMESTAMP_MICROS(event_timestamp) AS event_time,
  event_date,
  device.category AS device_category,
  device.operating_system AS os,
  device.language AS language,
  device.mobile_brand_name AS mobile_brand,
  traffic_source.source AS source,
  traffic_source.medium AS medium,
  SAFE_CAST(traffic_source.name AS STRING) AS campaign,
  geo.country AS country,
  geo.region AS region,
  geo.city AS city,
  event_name AS step
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE _TABLE_SUFFIX >= '00000000'
  AND event_name IN (
    'session_start',
    'view_item',
    'add_to_cart',
    'begin_checkout',
    'add_shipping_info',
    'add_payment_info',
    'purchase'
  )
