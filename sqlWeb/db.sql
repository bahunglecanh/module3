


-- Bảng tài khoản người dùng (user và admin)
CREATE TABLE accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Danh mục sản phẩm
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- Sản phẩm
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200),
    description TEXT,
    price DECIMAL(10,2),
    image_url VARCHAR(255),
    category_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Biến thể sản phẩm theo size và số lượng tồn kho
CREATE TABLE product_variants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    size VARCHAR(10),
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Giỏ hàng
CREATE TABLE carts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

-- Chi tiết giỏ hàng
CREATE TABLE cart_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT,
    product_variant_id INT,
    quantity INT,
    FOREIGN KEY (cart_id) REFERENCES carts(id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variants(id)
);

-- Đơn hàng
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    shipping_address TEXT,
    payment_method VARCHAR(50),
    total_amount DECIMAL(10,2),
    status ENUM('pending', 'processing', 'shipped', 'delivered', 'cancelled') DEFAULT 'pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

-- Chi tiết đơn hàng
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_variant_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variants(id)
);

-- Tin nhắn hỗ trợ
CREATE TABLE messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT,
    receiver_id INT,
    message TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES accounts(id),
    FOREIGN KEY (receiver_id) REFERENCES accounts(id)
);

-- Lưu log email gửi đi (ví dụ xác nhận đơn hàng)
CREATE TABLE email_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    email_type VARCHAR(50),
    content TEXT,
    sent_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

-- Bảng thông báo lỗi cho người dùng
CREATE TABLE error_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    error_message TEXT,
    occurred_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(id)
);

INSERT INTO products (product_name, image_url, description) VALUES
-- 1
('Giày Asics Gel Resolution X ‘White Black’ 1041A481-100', 'https://authentic-shoes.com/wp-content/uploads/2025/02/1041A481-100.png',
 'Phiên bản Asics Gel Resolution X màu trắng đen mang đến sự ổn định và bám sân vượt trội, lý tưởng cho các tay vợt chuyên nghiệp cần sự linh hoạt trong từng bước di chuyển.'),
-- 2
('Giày Nike Air Zoom Vapor Pro 3 ‘Binary Blue’ FZ2161-100', 'https://authentic-shoes.com/wp-content/uploads/2025/01/M-ZOOM-VAPOR-PRO-3-HC.png',
 'Nike Air Zoom Vapor Pro 3 với tông xanh Binary Blue mạnh mẽ, hỗ trợ phản hồi nhanh, thích hợp với những trận đấu tốc độ cao.'),
-- 3
('Giày Babolat Jet Mach ‘Fluo Yellow’ 3A0S25B932-7002', 'https://authentic-shoes.com/wp-content/uploads/2025/04/3A0S25B932-JET_MACH_PKL_MEN-7002.png',
 'Jet Mach Fluo Yellow là dòng giày tennis siêu nhẹ, thiết kế tối ưu cho tốc độ và độ linh hoạt trên mọi mặt sân.'),
-- 4
('Giày Babolat Jet Mach 3 ‘Red White’ 30F22629-1005', 'https://authentic-shoes.com/wp-content/uploads/2024/12/618XlKgHnwL._AC_UF10001000_QL80.png',
 'Babolat Jet Mach 3 đỏ trắng với công nghệ Matryx® EVO tăng cường độ bền, tạo cảm giác chắc chắn cho người chơi.'),
-- 5
('Giày Lacoste Tennis AG-LT23 Ultra ‘Red Black’ 47SMA0101-R7S', 'https://authentic-shoes.com/wp-content/uploads/2024/08/47sma0101-rs7-sub1.2024011801584-600x306.png',
 'Đôi giày Lacoste AG-LT23 Ultra nổi bật với thiết kế đỏ đen đầy cá tính, mang lại sự hỗ trợ và êm ái cho các vận động viên tennis chuyên nghiệp.'),
-- 6
('Giày Skechers Viper Court Pro ‘Pink’ 246069-PNK', 'https://authentic-shoes.com/wp-content/uploads/2025/02/246069-PNK0.png',
 'Skechers Viper Court Pro phiên bản màu hồng dành riêng cho nữ với đệm Arch Fit tạo cảm giác dễ chịu suốt cả ngày.'),
-- 7
('Giày Asics Court FF 3 Novak ‘White Tuna Blue’ 1041A522-967', 'https://authentic-shoes.com/wp-content/uploads/2025/06/1041A522_967_SR_RT_GLB.png',
 'Court FF 3 Novak White Tuna Blue là dòng giày hỗ trợ Novak Djokovic, kết hợp hoàn hảo giữa tốc độ và sự ổn định.'),
-- 8
('Giày Asics Gel Resolution X ‘White Pure Silver’ 1042A279-100', 'https://authentic-shoes.com/wp-content/uploads/2025/02/1042A279-100.png',
 'Asics Gel Resolution X màu trắng bạc mang phong cách hiện đại, thiết kế dành cho những vận động viên cần độ bền và hỗ trợ tối đa.'),
-- 9
('Giày Nike GP Challenge 1 x Naomi Osaka ‘Pink Foam’ HJ6643-601', 'https://authentic-shoes.com/wp-content/uploads/2025/04/Nike-GP-Challenge-1-Naomi-Osaka.png',
 'GP Challenge 1 Naomi Osaka bản giới hạn màu hồng nhẹ, mang phong cách nữ tính và công nghệ đệm tiên tiến từ Nike.'),
-- 10
('Giày Wilson Rush Pro 4.5 Clay RG ‘White’ WRS335960', 'https://authentic-shoes.com/wp-content/uploads/2025/06/Giay-Wilson-Rush-Pro-4.5-Clay-RG-White-WRS335960-1.png',
 'Wilson Rush Pro 4.5 bản sân đất nện màu trắng mang lại cảm giác ổn định và kiểm soát tối đa khi thi đấu.'),
-- 11
('Giày Wilson Rush Pro 4.5 Clay RG ‘White’ WRS335960', 'https://authentic-shoes.com/wp-content/uploads/2025/05/2-1-7-e1746513091363-600x275.png',
 'Phiên bản Wilson Rush Pro 4.5 Clay RG với thiết kế tối giản nhưng mạnh mẽ, đảm bảo hiệu suất thi đấu trên sân đất nện.'),
-- 12
('Giày On Running Roger Pro 2 ‘White Malibu’ 3ME10302840', 'https://authentic-shoes.com/wp-content/uploads/2024/10/3ME10302840-1-600x289.png',
 'Roger Pro 2 từ thương hiệu On Running, thiết kế tối ưu cho Roger Federer với tông trắng Malibu tinh tế, mang lại cảm giác linh hoạt và nhẹ nhàng.');
