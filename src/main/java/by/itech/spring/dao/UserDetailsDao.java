package by.itech.spring.dao;

import by.itech.spring.model.User;

public interface UserDetailsDao {
    User findUserByUsername(String username);
}
