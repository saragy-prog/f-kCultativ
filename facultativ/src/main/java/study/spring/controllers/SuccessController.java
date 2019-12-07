package study.spring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import study.spring.DAO.CurseDAO;
import study.spring.DAO.UserDAO;
import study.spring.entity.User;
import study.spring.form.LoginForm;
import study.spring.form.UpdateForm;

import javax.annotation.Resource;

@Controller
@SessionAttributes("loginForm")
public class SuccessController {

    //@Resource нужен для инжекта бина, опиаснного в конфигурационном xml-файле
    @Resource(name = "curseDAO")
    private CurseDAO curseDAO;
    @Resource(name = "userDAO")
    private UserDAO userDAO;

     // Then annotation @RequestParam from the HttpRequest would extract the value
     // pressed by the user; String input here - the name of the button on jsp-page
    //используем ModelAndView для динамического вывода списка курсов, добавляя список как 
    //атрибут в объект ModelMap. Этот объект вместе с атрибутами "прикрепляется" к jsp-страничке
    //когда создается новый объект ModelAndView("loginsuccess", modelMap)
    @RequestMapping(value = "loginsuccess.html", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView onSubmit(@RequestParam(required = true) String input,
                                 LoginForm loginForm) throws IllegalArgumentException {
        ModelMap modelMap = new ModelMap();
        switch (input) {
            case "back":
                loginForm.setUserName("");
                loginForm.setPassword("");
                modelMap.clear();
                return new ModelAndView("redirect:/");
            case "add":
            case "delete":
                UpdateForm updateForm = new UpdateForm();
                modelMap.addAttribute("updateForm", updateForm);
                return new ModelAndView("update", modelMap);
            case "show":
                String pass = loginForm.getPassword();
                User user = userDAO.getRecords("password", pass);
                modelMap.addAttribute("cursesList", userDAO.getCurses(user));
                return new ModelAndView("loginsuccess", modelMap);
            case "showAll":
                modelMap.addAttribute("cursesList", curseDAO.getAllRecords());
                return new ModelAndView("loginsuccess", modelMap);
            default:
                throw new IllegalArgumentException();
        }
    }
}