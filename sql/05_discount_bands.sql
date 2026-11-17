SELECT
  CASE
    WHEN discount = 0 THEN '0%'
    WHEN discount <= 0.10 THEN '1-10%'
    WHEN discount <= 0.20 THEN '11-20%'
    WHEN discount <= 0.30 THEN '21-30%'
    ELSE '>30%'
  END AS discount_band,
  COUNT(*) AS order_lines,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit,
  ROUND(100.0 * SUM(profit) / SUM(sales), 2) AS margin_pct,
  ROUND(100.0 * SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_loss_lines
FROM superstore_clean
GROUP BY discount_band
ORDER BY MIN(discount);
