SELECT name AS DishName 
FROM menu_items 
WHERE id = ANY (
	SELECT menu_item_id 
	FROM menu_item_orders 
	GROUP BY menu_item_id 
	HAVING SUM(quantity) > 2
);

-- menu_item_orders has its own quantity value, 
-- so the orders table isn't needed here.


