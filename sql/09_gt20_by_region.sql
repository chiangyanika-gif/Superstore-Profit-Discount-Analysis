SELECT sub_category,
  SUM(CASE WHEN region = 'Central' AND discount > 0.20 THEN 1 ELSE 0 END) AS central_gt20,
  SUM(CASE WHEN region = 'East'    AND discount > 0.20 THEN 1 ELSE 0 END) AS east_gt20,
  SUM(CASE WHEN region = 'South'   AND discount > 0.20 THEN 1 ELSE 0 END) AS south_gt20,
  SUM(CASE WHEN region = 'West'    AND discount > 0.20 THEN 1 ELSE 0 END) AS west_gt20
FROM superstore_clean
GROUP BY sub_category
ORDER BY sub_category;
