package hunglcb.example.ex11.repository;

import hunglcb.example.ex11.model.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class UserRepositoryTest {
    
    private IUserRepository userRepository;
    
    @BeforeEach
    void setUp() {
        userRepository = new UserRepositoryImpl();
    }
    
    @Test
    void testFindAll() {
        // Test lấy danh sách tất cả users sử dụng Stored Procedure GetAllUsers()
        List<User> users = userRepository.findAll();
        assertNotNull(users);
        // Có thể thêm assertions khác tùy thuộc vào dữ liệu trong database
    }
    
    @Test
    void testFindById() {
        // Test tìm user theo ID sử dụng Stored Procedure GetUserById()
        User user = userRepository.findById(1);
        // Nếu có user với ID = 1, kiểm tra thông tin
        if (user != null) {
            assertEquals(1, user.getId());
            assertNotNull(user.getName());
            assertNotNull(user.getEmail());
            assertNotNull(user.getCountry());
        }
    }
    
    @Test
    void testSave() {
        // Test thêm user mới sử dụng Stored Procedure InsertUser()
        User newUser = new User(0, "Test User", "test@example.com", "Test Country");
        userRepository.save(newUser);
        
        // Kiểm tra xem user đã được thêm chưa
        List<User> users = userRepository.findAll();
        boolean found = users.stream()
                .anyMatch(u -> u.getName().equals("Test User") && 
                             u.getEmail().equals("test@example.com"));
        assertTrue(found, "User mới phải được thêm vào database");
    }
    
    @Test
    void testUpdate() {
        // Test cập nhật user sử dụng Stored Procedure UpdateUser()
        User userToUpdate = userRepository.findById(1);
        if (userToUpdate != null) {
            String originalName = userToUpdate.getName();
            userToUpdate.setName("Updated Name");
            
            userRepository.update(userToUpdate);
            
            // Kiểm tra xem user đã được cập nhật chưa
            User updatedUser = userRepository.findById(1);
            assertNotNull(updatedUser);
            assertEquals("Updated Name", updatedUser.getName());
            
            // Khôi phục tên ban đầu
            userToUpdate.setName(originalName);
            userRepository.update(userToUpdate);
        }
    }
    
    @Test
    void testDelete() {
        // Test xóa user sử dụng Stored Procedure DeleteUser()
        // Lưu ý: Test này có thể ảnh hưởng đến dữ liệu thực
        // Nên chỉ chạy trong môi trường test
        User userToDelete = new User(0, "User To Delete", "delete@example.com", "Delete Country");
        userRepository.save(userToDelete);
        
        // Tìm user vừa thêm để lấy ID
        List<User> users = userRepository.findAll();
        User foundUser = users.stream()
                .filter(u -> u.getName().equals("User To Delete"))
                .findFirst()
                .orElse(null);
        
        if (foundUser != null) {
            int userId = foundUser.getId();
            userRepository.delete(userId);
            
            // Kiểm tra xem user đã được xóa chưa
            User deletedUser = userRepository.findById(userId);
            assertNull(deletedUser, "User phải được xóa khỏi database");
        }
    }
    
    @Test
    void testSearchByCountry() {
        // Test tìm kiếm users theo country sử dụng Stored Procedure SearchUsersByCountry()
        List<User> users = userRepository.searchByCountry("Vietnam");
        assertNotNull(users);
        // Kiểm tra xem tất cả users trả về có country chứa "Vietnam" không
        users.forEach(user -> 
            assertTrue(user.getCountry().toLowerCase().contains("vietnam"), 
                      "Tất cả users phải có country chứa 'Vietnam'")
        );
    }
    
    @Test
    void testSortByName() {
        // Test sắp xếp users theo tên sử dụng Stored Procedure SortUsersByName()
        List<User> users = userRepository.sortByName();
        assertNotNull(users);
        
        // Kiểm tra xem danh sách có được sắp xếp theo thứ tự tăng dần không
        for (int i = 0; i < users.size() - 1; i++) {
            String currentName = users.get(i).getName();
            String nextName = users.get(i + 1).getName();
            assertTrue(currentName.compareToIgnoreCase(nextName) <= 0, 
                      "Danh sách phải được sắp xếp theo thứ tự tăng dần");
        }
    }
}
