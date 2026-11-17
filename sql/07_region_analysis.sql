SELECT
  region,
  COUNT(*) AS order_lines,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND(100.0 * SUM(profit) / SUM(sales), 2) AS margin_pct,
  ROUND(AVG(discount), 3) AS avg_discount,
  ROUND(100.0 * SUM(CASE WHEN discount > 0.20 THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_lines_gt20,
  ROUND(SUM(CASE WHEN discount > 0.20 THEN profit ELSE 0 END), 2) AS profit_gt20
FROM superstore_clean
GROUP BY region
ORDER BY total_profit ASC;
