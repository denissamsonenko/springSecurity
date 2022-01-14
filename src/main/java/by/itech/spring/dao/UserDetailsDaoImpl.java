package by.itech.spring.dao;

import by.itech.spring.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class UserDetailsDaoImpl implements UserDetailsDao {

    private final DataSource dataSource;

    @Autowired
    public UserDetailsDaoImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    private static final String FIND_USER = "SELECT first_name, email, password, authority from users u join authorities a on (u.id=a.id) where first_name =?";

    @Override
    public User findUserByUsername(String userName) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        User user = new User();
        try {
            con = dataSource.getConnection();
            ps = con.prepareStatement(FIND_USER);
            ps.setString(1, userName);
            rs = ps.executeQuery();

            while (rs.next()) {
                user.setFirstName(rs.getString("first_name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setAuthority(rs.getString("authority"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }
}
