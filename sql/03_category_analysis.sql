SELECT
  category,
  COUNT(*) AS order_lines,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND(100.0 * SUM(profit) / SUM(sales), 2) AS margin_pct,
  ROUND(AVG(discount), 3) AS avg_discount
FROM superstore_clean
GROUP BY category
ORDER BY total_profit DESC;
