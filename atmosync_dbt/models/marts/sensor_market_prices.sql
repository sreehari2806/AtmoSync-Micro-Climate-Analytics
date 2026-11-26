WITH sensor_data AS (

    SELECT *
    FROM {{ ref('stg_sensor_readings') }}

),

market_prices AS (

    SELECT *
    FROM {{ ref('mock_commodity_prices') }}

)

SELECT
    s.TIMESTAMP,
    s.CONTAINER_ID,
    s.COMMODITY,
    s.TEMPERATURE,
    s.HUMIDITY,
    s.VIBRATION,
    s.CONTAINER_STATUS,

    p.MARKET,
    p.PRICE_PER_UNIT,
    p.UNIT,
    p.CURRENCY,
    p.PRICE_DATE

FROM sensor_data s

INNER JOIN market_prices p
    ON LOWER(s.COMMODITY) = LOWER(p.COMMODITY)