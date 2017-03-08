package javarush.ru.stajirovka.dao.impl;

import javarush.ru.stajirovka.dao.UserDAO;
import javarush.ru.stajirovka.entity.User;
import javarush.ru.stajirovka.util.HibernateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDAO{

    @Autowired
    private HibernateUtil hibernateUtil;

    public UserDaoImpl() {
    }

    @Override
    public long createUser(User user) {
        return (Long) hibernateUtil.create(user);
    }

    @Override
    public User updateUser(User user) {
        return hibernateUtil.update(user);
    }

    @Override
    public void deleteUser(long id) {
        User user = new User();
        user.setId(id);
        hibernateUtil.delete(user);
    }

    @Override
    public List<User> getAllUsers() {
        return hibernateUtil.fetchAll(User.class);
    }

    @Override
    public User getUser(long id) {
        return hibernateUtil.fetchById(id, User.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<User> getAllUsers(String userName) {
        String query = "SELECT e.* FROM test e WHERE e.name like '%"+ userName +"%'";
        List<Object[]> employeeObjects = hibernateUtil.fetchAll(query);
        List<User> users = new ArrayList<User>();
        for(Object[] userObject: employeeObjects) {

            User user = new User();

            long id = (Integer) userObject[0];
            String name = (String) userObject[1];
            int age = (int) userObject[2];
            boolean isAdmin = (boolean) userObject[3];
            Date createDate = (Date)userObject[4];

            user.setId(id);
            user.setName(name);
            user.setAge(age);
            user.setAdmin(isAdmin);
            user.setCreatedDate(createDate);

            users.add(user);
        }
        return users;
    }
}
