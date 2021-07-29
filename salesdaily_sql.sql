WITH PHARMA_SALES_DATA AS
  (SELECT "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."DATUM" AS "DATUM",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."M01AB" AS "M01AB",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."M01AE" AS "M01AE",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."N02BA" AS "N02BA",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."N02BE" AS "N02BE",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."N05B" AS "N05B",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."N05C" AS "N05C",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."R03" AS "R03",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."R06" AS "R06",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."YEAR" AS "YEAR",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."MONTH" AS "MONTH",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."HOUR" AS "HOUR",
          "snowflake"."SCHEMA_INFO"."SALESDAILY_S"."WEEKDAY_NAME" AS "WEEKDAY_NAME"
   FROM "snowflake"."SCHEMA_INFO"."SALESDAILY_S")
SELECT (PHARMA_SALES_DATA."DATUM") AS "DATE",
       (PHARMA_SALES_DATA."M01AB") AS "Acetic Acid Derivatives"
FROM PHARMA_SALES_DATA
