SELECT COUNT(*) AS duplicate_groups
FROM (
  SELECT "Order ID", "Product ID", "Sales", "Quantity", "Discount", "Profit"
  FROM superstore
  GROUP BY "Order ID", "Product ID", "Sales", "Quantity", "Discount", "Profit"
  HAVING COUNT(*) > 1
);

SELECT
  SUM(CASE WHEN "Order Date" GLOB '[0-9]*/[0-9]*/[0-9][0-9][0-9][0-9]' THEN 1 ELSE 0 END) AS order_date_ok,
  SUM(CASE WHEN "Order Date" NOT GLOB '[0-9]*/[0-9]*/[0-9][0-9][0-9][0-9]' THEN 1 ELSE 0 END) AS order_date_bad,
  SUM(CASE WHEN "Ship Date" GLOB '[0-9]*/[0-9]*/[0-9][0-9][0-9][0-9]' THEN 1 ELSE 0 END) AS ship_date_ok,
  SUM(CASE WHEN "Ship Date" NOT GLOB '[0-9]*/[0-9]*/[0-9][0-9][0-9][0-9]' THEN 1 ELSE 0 END) AS ship_date_bad
FROM superstore;

SELECT
  MAX(CAST(substr("Order Date", 1, instr("Order Date", '/') - 1) AS INTEGER)) AS max_first_part
FROM superstore;

SELECT
  MIN(CAST("Sales" AS REAL)) AS min_sales,
  MAX(CAST("Sales" AS REAL)) AS max_sales,
  MIN(CAST("Discount" AS REAL)) AS min_discount,
  MAX(CAST("Discount" AS REAL)) AS max_discount,
  MIN(CAST("Profit" AS REAL)) AS min_profit,
  MAX(CAST("Profit" AS REAL)) AS max_profit
FROM superstore;
