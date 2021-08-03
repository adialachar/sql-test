SELECT
  date_parse(
    "mysql"."promethium"."automotive_sales_by_country"."Date",
    '%m/%Y'
  ) AS "Date",
  "mysql"."promethium"."automotive_sales_by_country"."USA" AS "USA",
  "mysql"."promethium"."automotive_sales_by_country"."Canada" AS "Canada",
  "mysql"."promethium"."automotive_sales_by_country"."Mexico" AS "Mexico",
  sum(
    sum(
      "mysql"."promethium"."automotive_sales_by_country"."USA"
    )
  ) over (
    order by
      date_trunc(
        'month',
        date_parse(
          "mysql"."promethium"."automotive_sales_by_country"."Date",
          '%m/%Y'
        )
      ) rows unbounded preceding
  ) as "cummulative_automotive_sales_usa",
  sum(
    sum(
      "mysql"."promethium"."automotive_sales_by_country"."Canada"
    )
  ) over (
    order by
      date_trunc(
        'month',
        date_parse(
          "mysql"."promethium"."automotive_sales_by_country"."Date",
          '%m/%Y'
        )
      ) rows unbounded preceding
  ) as "cummulative_automotive_sales_canada",
  sum(
    sum(
      "mysql"."promethium"."automotive_sales_by_country"."Mexico"
    )
  ) over (
    order by
      date_trunc(
        'month',
        date_parse(
          "mysql"."promethium"."automotive_sales_by_country"."Date",
          '%m/%Y'
        )
      ) rows unbounded preceding
  ) as "cummulative_automotive_sales_mexico"
FROM
  "mysql"."promethium"."automotive_sales_by_country"
GROUP BY
  date_parse(
    "mysql"."promethium"."automotive_sales_by_country"."Date",
    '%m/%Y'
  ),
  "mysql"."promethium"."automotive_sales_by_country"."USA",
  "mysql"."promethium"."automotive_sales_by_country"."Canada",
  "mysql"."promethium"."automotive_sales_by_country"."Mexico"
LIMIT
  200