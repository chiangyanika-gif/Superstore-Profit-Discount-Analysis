SELECT
  sub_category,
  SUM(CASE WHEN discount <= 0.20 THEN 1 ELSE 0 END) AS lines_le20,
  ROUND(SUM(CASE WHEN discount <= 0.20 THEN profit ELSE 0 END), 2) AS profit_le20,
  SUM(CASE WHEN discount > 0.20 THEN 1 ELSE 0 END) AS lines_gt20,
  ROUND(SUM(CASE WHEN discount > 0.20 THEN profit ELSE 0 END), 2) AS profit_gt20,
  ROUND(SUM(profit), 2) AS total_profit
FROM superstore_clean
GROUP BY sub_category
ORDER BY profit_gt20 ASC;
