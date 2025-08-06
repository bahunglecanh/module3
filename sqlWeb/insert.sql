

INSERT INTO products (name, description, price, image_url, category_id, created_at, updated_at) VALUES
('Giày Asics Gel Resolution X ‘White Black’ 1041A481-100', 'Phiên bản Asics Gel Resolution X màu trắng đen mang đến sự ổn định và bám sân vượt trội, lý tưởng cho các tay vợt chuyên nghiệp cần sự linh hoạt trong từng bước di chuyển.', 3590000, 'https://authentic-shoes.com/wp-content/uploads/2025/02/1041A481-100.png', 1, NOW(), NOW()),
('Giày Nike Air Zoom Vapor Pro 3 ‘Binary Blue’ FZ2161-100', 'Nike Air Zoom Vapor Pro 3 với tông xanh Binary Blue mạnh mẽ, hỗ trợ phản hồi nhanh, thích hợp với những trận đấu tốc độ cao.', 3290000, 'https://authentic-shoes.com/wp-content/uploads/2025/01/M-ZOOM-VAPOR-PRO-3-HC.png', 1, NOW(), NOW()),
('Giày Babolat Jet Mach ‘Fluo Yellow’ 3A0S25B932-7002', 'Jet Mach Fluo Yellow là dòng giày tennis siêu nhẹ, thiết kế tối ưu cho tốc độ và độ linh hoạt trên mọi mặt sân.', 3190000, 'https://authentic-shoes.com/wp-content/uploads/2025/04/3A0S25B932-JET_MACH_PKL_MEN-7002.png', 1, NOW(), NOW()),
('Giày Babolat Jet Mach 3 ‘Red White’ 30F22629-1005', 'Babolat Jet Mach 3 đỏ trắng với công nghệ Matryx® EVO tăng cường độ bền, tạo cảm giác chắc chắn cho người chơi.', 2990000, 'https://authentic-shoes.com/wp-content/uploads/2024/12/618XlKgHnwL._AC_UF10001000_QL80.png', 1, NOW(), NOW()),
('Giày Lacoste Tennis AG-LT23 Ultra ‘Red Black’ 47SMA0101-R7S', 'Đôi giày Lacoste AG-LT23 Ultra nổi bật với thiết kế đỏ đen đầy cá tính, mang lại sự hỗ trợ và êm ái cho các vận động viên tennis chuyên nghiệp.', 3990000, 'https://authentic-shoes.com/wp-content/uploads/2024/08/47sma0101-rs7-sub1.2024011801584-600x306.png', 1, NOW(), NOW()),
('Giày Skechers Viper Court Pro ‘Pink’ 246069-PNK', 'Skechers Viper Court Pro phiên bản màu hồng dành riêng cho nữ với đệm Arch Fit tạo cảm giác dễ chịu suốt cả ngày.', 2690000, 'https://authentic-shoes.com/wp-content/uploads/2025/02/246069-PNK0.png', 1, NOW(), NOW()),
('Giày Asics Court FF 3 Novak ‘White Tuna Blue’ 1041A522-967', 'Court FF 3 Novak White Tuna Blue là dòng giày hỗ trợ Novak Djokovic, kết hợp hoàn hảo giữa tốc độ và sự ổn định.', 3890000, 'https://authentic-shoes.com/wp-content/uploads/2025/06/1041A522_967_SR_RT_GLB.png', 1, NOW(), NOW()),
('Giày Asics Gel Resolution X ‘White Pure Silver’ 1042A279-100', 'Asics Gel Resolution X màu trắng bạc mang phong cách hiện đại, thiết kế dành cho những vận động viên cần độ bền và hỗ trợ tối đa.', 3090000, 'https://authentic-shoes.com/wp-content/uploads/2025/02/1042A279-100.png', 1, NOW(), NOW()),
('Giày Nike GP Challenge 1 x Naomi Osaka ‘Pink Foam’ HJ6643-601', 'GP Challenge 1 Naomi Osaka bản giới hạn màu hồng nhẹ, mang phong cách nữ tính và công nghệ đệm tiên tiến từ Nike.', 3490000, 'https://authentic-shoes.com/wp-content/uploads/2025/04/Nike-GP-Challenge-1-Naomi-Osaka.png', 1, NOW(), NOW()),
('Giày Wilson Rush Pro 4.5 Clay RG ‘White’ WRS335960', 'Wilson Rush Pro 4.5 bản sân đất nện màu trắng mang lại cảm giác ổn định và kiểm soát tối đa khi thi đấu.', 3190000, 'https://authentic-shoes.com/wp-content/uploads/2025/06/Giay-Wilson-Rush-Pro-4.5-Clay-RG-White-WRS335960-1.png', 1, NOW(), NOW()),
('Giày Wilson Rush Pro 4.5 Clay RG ‘White’ WRS335960', 'Phiên bản Wilson Rush Pro 4.5 Clay RG với thiết kế tối giản nhưng mạnh mẽ, đảm bảo hiệu suất thi đấu trên sân đất nện.', 3190000, 'https://authentic-shoes.com/wp-content/uploads/2025/05/2-1-7-e1746513091363-600x275.png', 1, NOW(), NOW()),
('Giày On Running Roger Pro 2 ‘White Malibu’ 3ME10302840', 'Roger Pro 2 từ thương hiệu On Running, thiết kế tối ưu cho Roger Federer với tông trắng Malibu tinh tế, mang lại cảm giác linh hoạt và nhẹ nhàng.', 4190000, 'https://authentic-shoes.com/wp-content/uploads/2024/10/3ME10302840-1-600x289.png', 1, NOW(), NOW());


-- ======================
-- 🏷️ 1. categories
-- ======================
INSERT INTO categories (name, description) VALUES
('Tennis Shoes', 'Các mẫu giày chuyên dụng cho thi đấu tennis chuyên nghiệp.'),
('Training Shoes', 'Giày tập luyện đa năng với độ bám và êm ái cao.'),
('Lifestyle', 'Giày thể thao phong cách thời trang, có thể dùng hằng ngày.');

-- ======================
-- 👤 2. accounts
-- ======================
INSERT INTO accounts (full_name, email, password_hash, phone, role) VALUES
('Nguyen Van A', 'a@example.com', 'hashed_password1', '0901234567', 'user'),
('Le Thi B', 'b@example.com', 'hashed_password2', '0902345678', 'user'),
('Admin User', 'admin@example.com', 'hashed_admin_password', '0903456789', 'admin');

-- ======================
-- 👟 3. product_variants
-- ======================
INSERT INTO product_variants (product_id, size, stock_quantity) VALUES
(1, '40', 10), (1, '41', 15), (1, '42', 8),
(2, '39', 12), (2, '40', 9), (2, '42', 7),
(3, '40', 14), (3, '41', 10), (3, '43', 5),
(4, '40', 9), (4, '41', 12), (4, '42', 7),
(5, '38', 8), (5, '39', 10), (5, '40', 6);

-- ======================
-- 🛒 4. carts
-- ======================
INSERT INTO carts (account_id) VALUES
(1),
(2);

-- ======================
-- 📦 5. cart_items
-- ======================
INSERT INTO cart_items (cart_id, product_variant_id, quantity) VALUES
(1, 1, 2),
(1, 5, 1),
(2, 7, 3);

-- ======================
-- 📬 6. orders
-- ======================
INSERT INTO orders (account_id, shipping_address, payment_method, total_amount, status) VALUES
(1, '123 Đường Lê Lợi, TP.HCM', 'COD', 2990000, 'processing'),
(2, '456 Đường Trần Hưng Đạo, Hà Nội', 'Credit Card', 1550000, 'pending');

-- ======================
-- 📦 7. order_items
-- ======================
INSERT INTO order_items (order_id, product_variant_id, quantity, price) VALUES
(1, 1, 1, 1495000),
(1, 2, 1, 1495000),
(2, 7, 1, 1550000);

-- ======================
-- 💬 8. messages
-- ======================
INSERT INTO messages (sender_id, receiver_id, message) VALUES
(1, 3, 'Tôi cần hỗ trợ về đơn hàng số 1'),
(3, 1, 'Chúng tôi đang xử lý đơn hàng của bạn'),
(2, 3, 'Giày tôi nhận bị sai size!');

-- ======================
-- 📧 9. email_logs
-- ======================
INSERT INTO email_logs (account_id, email_type, content) VALUES
(1, 'order_confirmation', 'Đơn hàng của bạn đã được xác nhận'),
(2, 'shipping_update', 'Đơn hàng của bạn đang được giao');

-- ======================
-- ⚠️ 10. error_logs
-- ======================
INSERT INTO error_logs (account_id, error_message) VALUES
(1, 'Lỗi khi thanh toán bằng thẻ'),
(2, 'Lỗi không hiển thị sản phẩm trong giỏ hàng');
