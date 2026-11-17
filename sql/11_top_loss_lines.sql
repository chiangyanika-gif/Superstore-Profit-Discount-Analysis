SELECT
  row_id,
  region,
  sub_category,
  discount,
  ROUND(sales, 2) AS sales,
  ROUND(profit, 2) AS profit
FROM superstore_clean
ORDER BY profit ASC
LIMIT 10;
