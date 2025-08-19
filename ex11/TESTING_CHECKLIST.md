# 🔧 TESTING CHECKLIST - Product Management System

## 1. Database Setup ✅
```bash
# Chạy trong MySQL Workbench hoặc command line:
# 1. Tạo bảng categories
source category_table_only.sql

# 2. Tạo bảng products với dữ liệu
source create_products_table.sql

# 3. Thêm foreign key (tùy chọn)
source add_foreign_key.sql

# 4. Kiểm tra dữ liệu
SELECT COUNT(*) FROM categories; -- Kết quả: 5
SELECT COUNT(*) FROM products;   -- Kết quả: 20
```

## 2. Database Connection ⚠️
**QUAN TRỌNG**: Cập nhật `ConnectionDB.java`
```java
// Thay đổi thông tin connection cho đúng:
private static final String URL = "jdbc:mysql://localhost:3306/ex12_user"; // Database của bạn
private static final String USER = "root";
private static final String PASS = "bahung123"; // Password của bạn
```

## 3. Build & Deploy ✅
```bash
# Build project
./gradlew clean build

# Deploy WAR file to Tomcat
# Copy build/libs/ex11-1.0-SNAPSHOT.war to Tomcat webapps/
```

## 4. Testing URLs 🌐

### Category Management:
- `http://localhost:8080/ex11/categories` - Danh sách danh mục
- `http://localhost:8080/ex11/categories?action=create` - Thêm danh mục
- `http://localhost:8080/ex11/categories?action=search&keyword=mobile` - Tìm kiếm

### Product Management:
- `http://localhost:8080/ex11/products` - Danh sách sản phẩm (có phân trang)
- `http://localhost:8080/ex11/products?action=create` - Thêm sản phẩm (có dropdown category)
- `http://localhost:8080/ex11/products?action=search&keyword=iphone` - Tìm kiếm
- `http://localhost:8080/ex11/products?action=searchByCategory&categoryId=2` - Lọc theo danh mục
- `http://localhost:8080/ex11/products?action=searchByPrice&minPrice=1000000&maxPrice=10000000` - Lọc theo giá

### Main Page:
- `http://localhost:8080/ex11/` - Trang chủ với navigation

## 5. Potential Issues & Solutions 🔧

### Issue 1: "categories" is empty in create form
**Symptom**: Dropdown danh mục trống khi tạo sản phẩm
**Solution**: Kiểm tra CategoryService có chạy đúng không
```java
// Test trong ProductServlet.showCreateForm()
System.out.println("Categories loaded: " + categories.size());
```

### Issue 2: Foreign key constraint error
**Symptom**: Không thể tạo sản phẩm với category_id
**Solution**: Chạy lại `add_foreign_key.sql` hoặc tạo sản phẩm với categoryId = 0

### Issue 3: Page not found (404)
**Symptom**: URL trả về 404
**Solution**: 
- Kiểm tra @WebServlet annotations
- Kiểm tra Tomcat deployment
- Kiểm tra web.xml

### Issue 4: Database connection error
**Symptom**: SQLException hoặc connection timeout
**Solution**:
- Kiểm tra MySQL service đang chạy
- Kiểm tra username/password trong ConnectionDB.java
- Kiểm tra database name có đúng không

## 6. Debug Steps 🐛

### Step 1: Test Database Connection
```java
// Thêm vào ConnectionDB.java để test:
public static void main(String[] args) {
    Connection conn = getConnectDB();
    if (conn != null) {
        System.out.println("✅ Database connection successful!");
        try { conn.close(); } catch (Exception e) {}
    } else {
        System.out.println("❌ Database connection failed!");
    }
}
```

### Step 2: Test Category Loading
```java
// Thêm vào CategoryServiceImpl để test:
public static void main(String[] args) {
    CategoryServiceImpl service = new CategoryServiceImpl();
    List<Category> categories = service.getAllCategories();
    System.out.println("Categories found: " + categories.size());
    for (Category cat : categories) {
        System.out.println("- " + cat.getName());
    }
}
```

### Step 3: Check Tomcat Logs
```bash
# Xem logs trong Tomcat
tail -f $TOMCAT_HOME/logs/catalina.out
```

## 7. Expected Results ✨

### Categories Page:
- Hiển thị 5 danh mục
- Search hoạt động
- Pagination (nếu > 5 items)
- CRUD operations hoạt động

### Products Page:
- Hiển thị 20 sản phẩm với pagination (4 trang, 5 items/trang)
- Category column hiển thị đúng
- Search box hoạt động
- Category filter dropdown có 5 options
- Price range filter hoạt động
- CRUD operations hoạt động với category selection

### Performance:
- Page load < 2 seconds
- Database queries optimized với JOIN
- No memory leaks

## 8. Final Verification ✅

- [ ] Database có đủ dữ liệu (5 categories, 20 products)
- [ ] All URLs accessible
- [ ] CRUD operations work
- [ ] Search functions work
- [ ] Pagination works
- [ ] Category relationships display correctly
- [ ] No console errors
- [ ] Responsive design works on mobile
