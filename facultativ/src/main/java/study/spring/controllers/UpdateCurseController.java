package study.spring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import study.spring.form.LoginForm;
import study.spring.form.UpdateForm;
import study.spring.form.UpdateValidator;

@Controller
// получение пользователя из сессии
@SessionAttributes("loginForm")
public class UpdateCurseController {
    @Autowired
    private UpdateValidator v;
    
    @RequestMapping(value = "update.html", method = RequestMethod.POST)
    public String onSubmit(UpdateForm updateForm, BindingResult result,
                           @RequestParam(required = true) String input, LoginForm loginForm) {
        switch (input) {
            case "add":
            case "delete":
                v.setParameters(loginForm.getPassword(), input);
                v.validate(updateForm, result);
                return "update";
            case "back":
                return "loginsuccess";
            default:
                throw new IllegalArgumentException();
        }
    }
}