# Product Management System

Ứng dụng quản lý sản phẩm với JDBC, CRUD operations, tìm kiếm và phân trang cho 2 đối tượng: Product và Category.

## Tính năng

### ✅ Đã hoàn thành:
- **CRUD Operations**: Thêm, sửa, xóa, xem cho Product và Category
- **JDBC Integration**: Kết nối MySQL database với Connection Pool
- **Tìm kiếm nâng cao**:
  - Tìm kiếm sản phẩm theo tên, danh mục, khoảng giá
  - Tìm kiếm danh mục theo tên
- **Phân trang**: Pagination cho danh sách sản phẩm và danh mục
- **Quan hệ Foreign Key**: Product liên kết với Category
- **Giao diện**: Responsive UI với Bootstrap 5

### Kiến trúc
- **Model**: `Product.java`, `Category.java`, `User.java`
- **Repository**: JDBC implementation với interface pattern
- **Service**: Business logic layer
- **Controller**: Servlet-based controllers
- **View**: JSP với JSTL

## Cài đặt

### 1. Cơ sở dữ liệu

#### Tạo database MySQL:
```sql
-- Chạy file database_setup.sql để tạo database và sample data
mysql -u root -p < database_setup.sql
```

#### Hoặc tự tạo:
```sql
CREATE DATABASE ex12_product_management;
USE ex12_product_management;

-- Tạo bảng categories
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tạo bảng products
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    description TEXT,
    manufacturer VARCHAR(255),
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
);

-- Tạo bảng users (từ bài trước)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    country VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### 2. Cấu hình database connection

Cập nhật thông tin kết nối trong `ConnectionDB.java`:
```java
private static final String URL = "jdbc:mysql://localhost:3306/ex12_product_management";
private static final String USER = "root";
private static final String PASS = "your_password";
```

### 3. Dependencies

Thêm vào `build.gradle`:
```gradle
dependencies {
    implementation 'javax.servlet:javax.servlet-api:4.0.1'
    implementation 'javax.servlet.jsp:javax.servlet.jsp-api:2.3.3'
    implementation 'javax.servlet:jstl:1.2'
    implementation 'mysql:mysql-connector-java:8.0.33'
    testImplementation 'junit:junit:4.13.2'
}
```

### 4. Deployment

1. Build project: `./gradlew build`
2. Deploy WAR file to Tomcat
3. Access: `http://localhost:8080/ex11/`

## Sử dụng

### Quản lý Danh mục
- **URL**: `/categories`
- **Tính năng**: CRUD, tìm kiếm theo tên, phân trang

### Quản lý Sản phẩm  
- **URL**: `/products`
- **Tính năng**: 
  - CRUD với category selection
  - Tìm kiếm theo từ khóa (tên, mô tả, nhà sản xuất)
  - Lọc theo danh mục
  - Lọc theo khoảng giá
  - Phân trang kết quả

### Quản lý Người dùng
- **URL**: `/users`
- **Tính năng**: CRUD, tìm kiếm, sắp xếp, transaction testing

## API Endpoints

### Categories
- `GET /categories` - Danh sách danh mục (có phân trang)
- `GET /categories?action=create` - Form thêm danh mục
- `POST /categories?action=create` - Thêm danh mục mới
- `GET /categories?action=edit&id={id}` - Form sửa danh mục
- `POST /categories?action=edit` - Cập nhật danh mục
- `GET /categories?action=delete&id={id}` - Xóa danh mục
- `GET /categories?action=search&keyword={keyword}` - Tìm kiếm danh mục

### Products
- `GET /products` - Danh sách sản phẩm (có phân trang)
- `GET /products?action=create` - Form thêm sản phẩm
- `POST /products?action=create` - Thêm sản phẩm mới
- `GET /products?action=edit&id={id}` - Form sửa sản phẩm
- `POST /products?action=edit` - Cập nhật sản phẩm
- `GET /products?action=delete&id={id}` - Xóa sản phẩm
- `GET /products?action=search&keyword={keyword}` - Tìm kiếm sản phẩm
- `GET /products?action=searchByCategory&categoryId={id}` - Lọc theo danh mục
- `GET /products?action=searchByPrice&minPrice={min}&maxPrice={max}` - Lọc theo giá

## Cấu trúc thư mục

```
src/main/
├── java/hunglcb/example/ex11/
│   ├── controller/
│   │   ├── CategoryController.java
│   │   ├── ProductServlet.java
│   │   └── UserController.java
│   ├── model/
│   │   ├── Category.java
│   │   ├── Product.java
│   │   └── User.java
│   ├── repository/
│   │   ├── CategoryRepositoryImpl.java
│   │   ├── ICategoryRepository.java
│   │   ├── ProductRepository.java
│   │   ├── ProductRepositoryJdbcImpl.java
│   │   └── ConnectionDB.java
│   └── service/
│       ├── CategoryServiceImpl.java
│       ├── ICategoryService.java
│       ├── ProductService.java
│       └── ProductServiceImpl.java
└── webapp/
    ├── WEB-INF/views/
    │   ├── category/
    │   │   ├── list.jsp
    │   │   ├── create.jsp
    │   │   ├── edit.jsp
    │   │   └── view.jsp
    │   └── product/
    │       ├── list.jsp
    │       ├── create.jsp
    │       ├── edit.jsp
    │       ├── view.jsp
    │       └── delete.jsp
    └── index.jsp
```

## Technical Stack

- **Backend**: Java Servlet, JSP, JSTL
- **Database**: MySQL 8.0+
- **Frontend**: Bootstrap 5, HTML5, CSS3
- **Build**: Gradle
- **Server**: Apache Tomcat 9+

## Performance Features

- **Connection Pooling**: Optimized database connections
- **Pagination**: Efficient data loading with LIMIT/OFFSET
- **Prepared Statements**: SQL injection prevention
- **Lazy Loading**: Category information loaded when needed
- **Responsive Design**: Mobile-friendly interface
