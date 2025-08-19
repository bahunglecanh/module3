-- Cập nhật category_id cho một số sản phẩm hiện có (tùy chọn)
-- Thay đổi theo tên sản phẩm thực tế trong database của bạn

UPDATE products SET category_id = 2 WHERE name LIKE '%iPhone%' OR name LIKE '%Samsung%' OR name LIKE '%phone%';
UPDATE products SET category_id = 3 WHERE name LIKE '%laptop%' OR name LIKE '%computer%' OR name LIKE '%MacBook%';
UPDATE products SET category_id = 5 WHERE name LIKE '%PlayStation%' OR name LIKE '%Xbox%' OR name LIKE '%gaming%';
UPDATE products SET category_id = 1 WHERE name LIKE '%AirPods%' OR name LIKE '%headphone%' OR name LIKE '%speaker%';
UPDATE products SET category_id = 4 WHERE name LIKE '%TV%' OR name LIKE '%washing%' OR name LIKE '%fridge%';
