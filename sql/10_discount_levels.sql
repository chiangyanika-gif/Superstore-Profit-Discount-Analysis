SELECT
  discount,
  COUNT(*) AS order_lines,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND(100.0 * SUM(profit) / SUM(sales), 2) AS margin_pct,
  ROUND(100.0 * SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_loss_lines
FROM superstore_clean
GROUP BY discount
ORDER BY discount;
