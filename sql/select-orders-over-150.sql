SELECT 
    customers.id AS CustomerID, 
    CONCAT(customers.first_name, ' ', customers.last_name) AS CustomerName, 
    orders.id AS OrderID, 
    orders.total_cost AS Cost,
    menus.name AS MenuName,
    menu_items.name AS CourseName
FROM
    customers
JOIN bookings ON customers.id = bookings.customer_id
JOIN orders ON bookings.id = orders.booking_id
JOIN menu_item_orders ON orders.id = menu_item_orders.order_id
JOIN menu_items ON menu_item_orders.menu_item_id = menu_items.id
JOIN menus ON menu_items.menu_id = menus.id
WHERE orders.total_cost > 150
ORDER BY orders.total_Cost ASC;

-- Bookings can have multiple orders, and 
-- orders can have multiple order items from multiple menus.
-- Each of the three orders below are across different menus, 
-- and so there is more than one row per OrderID as expected.
