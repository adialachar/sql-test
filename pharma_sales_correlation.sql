with v as (
  SELECT
    *
  from(
      values
        ('Anxiolytics'),('Sedatives'),('Antihistamines')
    ) as t(col_name)
),
d_tbl as (
  SELECT
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."DATUM" AS "DATUM",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."M01AB" AS "M01AB",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."M01AE" AS "M01AE",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."N02BA" AS "N02BA",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."N02BE" AS "N02BE",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."N05B" AS "Anxiolytics",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."N05C" AS "Sedatives",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."R03" AS "R03",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."R06" AS "Antihistamines",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."YEAR" AS "YEAR",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."MONTH" AS "MONTH",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."HOUR" AS "HOUR",
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."WEEKDAY_NAME" AS "WEEKDAY_NAME"
  FROM
    "snowflake"."SCHEMA_INFO"."SALESDAILY_S"
  LIMIT
    100
)
select
  a.col_name as medication_1,
  b.col_name as medication_2,
  corr(
    element_at(
      map_from_entries(
        ARRAY[('Anxiolytics', Anxiolytics),('Sedatives', Sedatives),('Antihistamines', Antihistamines)]
      ),
      a.col_name
    ),
    element_at(
      map_from_entries(
        ARRAY[('Anxiolytics', Anxiolytics),('Sedatives', Sedatives),('Antihistamines', Antihistamines)]
      ),
      b.col_name
    )
  ) as correlation_between_sales
from
  v a,
  v b,
  d_tbl
where
  a.col_name != b.col_name
group by
  a.col_name,
  b.col_name