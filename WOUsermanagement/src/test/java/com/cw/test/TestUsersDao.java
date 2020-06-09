package com.cw.test;

import com.cw.Dao.UsersDao;
import com.cw.model.Users;
import java.sql.SQLException;
import java.time.LocalDate;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class TestUsersDao {

    public Object now = LocalDate.now();

    public TestUsersDao() {
    }

    @BeforeAll
    public void setUp() throws Exception {
    }

    @Test
    public void testAddUser() throws SQLException {
        //For All Fields Filled

        Users user = new Users();
        UsersDao usersDao = new UsersDao();

        user.setUserName("Prms");
        user.setFname("Pranaya");
        user.setLname("Manandhar");
        user.setEmail("prn@gmail.com");
        user.setPassword("123456789");
        user.setQues1("Tommy");
        user.setQues2("Without You");
        user.setJoinDate(now);

        usersDao.newUser(user);
        String userNameExpected = "Prms";
        Users ActualUser = usersDao.getSUser("prn@gmail.com", "123456789");

        if (userNameExpected.equals(ActualUser.getUserName())) {
            assertTrue(true);
        } else {
            assertTrue(false);
        }
    }

    @Test
    public void testAddUserUserNameEmpty() throws SQLException {
        //For All Fields Filled

        Users user = new Users();
        UsersDao usersDao = new UsersDao();

        user.setUserName("");
        user.setFname("Nimesh");
        user.setLname("Amatya");
        user.setEmail("nimesh2@gmail.com");
        user.setPassword("123456789");
        user.setQues1("Tommy");
        user.setQues2("Without You");
        user.setJoinDate(now);

        usersDao.newUser(user);
        String userNameExpected = "";
        Users ActualUser = usersDao.getSUser("nimesh2@gmail.com", "123456789");

        if (userNameExpected.equals(ActualUser.getUserName())) {
            assertTrue(true);
        } else {
            assertTrue(false);
        }
    }

    @Test
    public void testAddUserFnameEmpty() throws SQLException {
        //For All Fields Filled

        Users user = new Users();
        UsersDao usersDao = new UsersDao();

        user.setUserName("RujanMan");
        user.setFname("");
        user.setLname("Shrestha");
        user.setEmail("rujan2@gmail.com");
        user.setPassword("123456789");
        user.setQues1("Tommy");
        user.setQues2("Without You");
        user.setJoinDate(now);

        usersDao.newUser(user);
        String fNameExpected = "";
        Users ActualUser = usersDao.getSUser("rujan2@gmail.com", "123456789");

        if (fNameExpected.equals(ActualUser.getFname())) {
            assertTrue(true);
        } else {
            assertTrue(false);
        }
    }

    @Test
    public void testAddUserDefaultuRole() throws SQLException {
        //For All Fields Filled

        Users user = new Users();
        UsersDao usersDao = new UsersDao();

        user.setUserName("Pranish");
        user.setFname("Pranish");
        user.setLname("Acharya");
        user.setEmail("pranish2@gmail.com");
        user.setPassword("123456789");
        user.setQues1("Tommy");
        user.setQues2("Without You");
        user.setJoinDate(now);

        usersDao.newUser(user);
        String uRoleExpected = "client";
        Users ActualUser = usersDao.getSUser("pranish2@gmail.com", "123456789");

        if (uRoleExpected.equals(ActualUser.getuRole())) {
            assertTrue(true);
        } else {
            assertTrue(false);
        }
    }

    @Test
    public void testAddUserDefaultStatus() throws SQLException {
        //For All Fields Filled

        Users user = new Users();
        UsersDao usersDao = new UsersDao();

        user.setUserName("Regisha");
        user.setFname("Regisha");
        user.setLname("Maharjan");
        user.setEmail("regisha2@gmail.com");
        user.setPassword("123456789");
        user.setQues1("Tommy");
        user.setQues2("Without You");
        user.setJoinDate(now);

        usersDao.newUser(user);
        String statusExpected = "active";
        Users ActualUser = usersDao.getSUser("regisha2@gmail.com", "123456789");

        if (statusExpected.equals(ActualUser.getStatus())) {
            assertTrue(true);
        } else {
            assertTrue(false);
        }
    }

    @Test
    public void testBlockUser() throws SQLException {
        UsersDao User = new UsersDao();
        User.blockUser(15);

        Users getUser = User.getUser(15);

        if (getUser.getStatus().equals("blocked")) {
            assertTrue(true);
        } else {
            assertTrue(false);
        }
    }
//

    @Test
    public void testUnblockUser() throws SQLException {
        UsersDao User = new UsersDao();
        User.unblockUser(15);

        Users getUser = User.getUser(15);

        if (getUser.getStatus().equals("active")) {
            assertTrue(true);
        } else {
            assertTrue(false);
        }
    }
//

    @Test
    public void testLogin() throws SQLException {
        //Login Test With Correct Credentials
        UsersDao loginDetail = new UsersDao();
        boolean loggedInResult = loginDetail.login("pranaya@gmail.com", "pomatoman");
        assertTrue(loggedInResult);
    }
//

    @Test
    public void testLoginWrongEmail() throws SQLException {
        //Login Test With Wrong Email
        UsersDao loginDetail = new UsersDao();
        boolean loggedInResult = loginDetail.login("prm@gmail.com", "pomatoman");
        assertTrue(loggedInResult == false);

    }
//

    @Test
    public void testLoginWrongPassword() throws SQLException {
        //Login Test With Wrong Email
        UsersDao loginDetail = new UsersDao();
        boolean loggedInResult = loginDetail.login("prn@gmail.com", "matoman");
        assertTrue(loggedInResult == false);

    }
//

    @Test
    public void testLoginEmptyFields() throws SQLException {
        //Login Test With Wrong Email
        UsersDao loginDetail = new UsersDao();
        boolean loggedInResult = loginDetail.login("", "");
        assertTrue(loggedInResult == false);

    }
//    

//    @Test
//    public void testDelete() throws SQLException {
//        UsersDao deleteUser = new UsersDao();
//        Users user1 = deleteUser.getSUser("prn@gmail.com", "123456789");
//        int userId1 = user1.getUserId();
//        deleteUser.deleteUser(userId1);
//        
//        Users user2 = deleteUser.getSUser("nimesh2@gmail.com", "123456789");
//        int userId2 = user2.getUserId();
//        deleteUser.deleteUser(userId2);
//        
//        Users user3 = deleteUser.getSUser("rujan2@gmail.com", "123456789");
//        int userId3 = user3.getUserId();
//        deleteUser.deleteUser(userId3);
//        
//        Users user4 = deleteUser.getSUser("pranish2@gmail.com", "123456789");
//        int userId4 = user4.getUserId();
//        deleteUser.deleteUser(userId4);
//        
//        Users user5 = deleteUser.getSUser("regisha2@gmail.com", "123456789");
//        int userId5 = user5.getUserId();
//        deleteUser.deleteUser(userId5);
//    }
}
