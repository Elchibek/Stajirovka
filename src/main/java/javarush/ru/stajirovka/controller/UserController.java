package javarush.ru.stajirovka.controller;

import javarush.ru.stajirovka.entity.User;
import javarush.ru.stajirovka.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {

    public UserController() {
    }

    @Autowired
    private UserService userService;

    @RequestMapping("createUser")
    public ModelAndView createUser(@ModelAttribute User user) {

        return new ModelAndView("userForm");
    }

    @RequestMapping("editUser")
    public ModelAndView editUser(@RequestParam long id, @ModelAttribute User user) {

        user = userService.getUser(id);
        return new ModelAndView("userForm", "userObject", user);
    }
    @RequestMapping("viewUser")
    public ModelAndView viewUser(@RequestParam long id, @ModelAttribute User user) {

        user = userService.getUser(id);
        return new ModelAndView("viewUser", "userObject", user);
    }

    @RequestMapping("saveUser")
    public ModelAndView saveUser(@ModelAttribute User user) {

        if(user.getId() == 0){
            userService.createUser(user);
        } else {
            userService.updateUser(user);
        }
        return new ModelAndView("redirect:getAllUsers");
    }

    @RequestMapping("deleteUser")
    public ModelAndView deleteUser(@RequestParam long id) {

        userService.deleteUser(id);
        return new ModelAndView("redirect:getAllUsers");
    }

    @RequestMapping(value = {"getAllUsers", "/"})
    public ModelAndView getAllUsers() {

        List<User> employeeList = userService.getAllUsers();
        return new ModelAndView("userList", "userList", employeeList);
    }

    @RequestMapping("searchEmployee")
    public ModelAndView searchUser(@RequestParam("searchName") String searchName) {

        List<User> employeeList = userService.getAllUsers(searchName);
        return new ModelAndView("userList", "userList", employeeList);
    }
}
