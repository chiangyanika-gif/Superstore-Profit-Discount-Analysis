DROP TABLE IF EXISTS superstore_clean;

CREATE TABLE superstore_clean AS
WITH s AS (
  SELECT *,
    substr("Order Date", instr("Order Date", '/') + 1) AS od_rest,
    substr("Ship Date",  instr("Ship Date",  '/') + 1) AS sd_rest
  FROM superstore
)
SELECT
  CAST("Row ID" AS INTEGER) AS row_id,
  "Order ID" AS order_id,
  printf('%04d-%02d-%02d',
    CAST(substr("Order Date", -4) AS INTEGER),
    CAST(substr("Order Date", 1, instr("Order Date", '/') - 1) AS INTEGER),
    CAST(substr(od_rest, 1, instr(od_rest, '/') - 1) AS INTEGER)
  ) AS order_date,
  printf('%04d-%02d-%02d',
    CAST(substr("Ship Date", -4) AS INTEGER),
    CAST(substr("Ship Date", 1, instr("Ship Date", '/') - 1) AS INTEGER),
    CAST(substr(sd_rest, 1, instr(sd_rest, '/') - 1) AS INTEGER)
  ) AS ship_date,
  "Ship Mode" AS ship_mode,
  "Customer ID" AS customer_id,
  "Segment" AS segment,
  "Region" AS region,
  "State" AS state,
  "Category" AS category,
  "Sub-Category" AS sub_category,
  "Product ID" AS product_id,
  CAST("Sales" AS REAL) AS sales,
  CAST("Quantity" AS INTEGER) AS quantity,
  CAST("Discount" AS REAL) AS discount,
  CAST("Profit" AS REAL) AS profit
FROM s;
