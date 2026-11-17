SELECT
  region,
  sub_category,
  SUM(CASE WHEN discount > 0.20 THEN 1 ELSE 0 END) AS lines_gt20,
  ROUND(SUM(CASE WHEN discount > 0.20 THEN profit ELSE 0 END), 2) AS profit_gt20
FROM superstore_clean
GROUP BY region, sub_category
HAVING lines_gt20 > 0
ORDER BY profit_gt20 ASC
LIMIT 15;
