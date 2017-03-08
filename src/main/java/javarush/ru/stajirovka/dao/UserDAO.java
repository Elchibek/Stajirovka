package javarush.ru.stajirovka.dao;

import javarush.ru.stajirovka.entity.User;

import java.util.List;

/**
 * Created by User on 05.03.17.
 */
public interface UserDAO {
    public long createUser(User user);
    public User updateUser(User user);
    public void deleteUser(long id);
    public List<User> getAllUsers();
    public User getUser(long id);
    public List<User> getAllUsers(String userName);
}
