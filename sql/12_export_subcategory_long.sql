SELECT
  sub_category,
  CASE WHEN discount <= 0.20 THEN '20% or less' ELSE 'Over 20%' END AS discount_group,
  COUNT(*) AS order_lines,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM superstore_clean
GROUP BY sub_category, discount_group
ORDER BY sub_category, discount_group;
