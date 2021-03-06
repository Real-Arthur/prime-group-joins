1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses"
ON "customers"."id" = "addresses"."customer_id";

2. Get all orders and their line items (orders, quantity and product).
SELECT * FROM "line_items"
JOIN "orders"
ON "line_items"."order_id" = "orders"."id"
JOIN "products"
ON "line_items"."product_id" = "products"."id";

3. Which warehouses have cheetos?
SELECT * FROM "warehouse"
JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products"
ON "warehouse_product"."product_id" = "products"."id"
WHERE "description" = 'cheetos';

4. Which warehouses have diet pepsi?
SELECT * FROM "warehouse"
JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products"
ON "warehouse_product"."product_id" = "products"."id"
WHERE "description" = 'diet pepsi'
ORDER BY "on_hand" DESC;

5.Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", COUNT("orders"."id") FROM "customers"
JOIN "addresses"
ON "customers"."id" = "addresses"."customer_id"
JOIN "orders"
ON "addresses"."id" = "orders"."address_id"
GROUP BY "customers"."first_name";

6. How many customers do we have?
SELECT COUNT(*) FROM "customers";

7. How many products do we carry?
SELECT COUNT(*) FROM "products";

8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product"."on_hand") 
FROM "products"
JOIN "warehouse_product"
ON "products"."id" = "warehouse_product"."product_id"
WHERE "description" = 'diet pepsi';
