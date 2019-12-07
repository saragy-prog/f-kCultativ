package study.spring.form;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import study.spring.DAO.UserDAO;
import study.spring.entity.User;

import javax.annotation.Resource;

@Service
public class LoginPasValidator implements Validator {

    @Resource(name = "userDAO")
    private UserDAO userDao;

    @Override
    public boolean supports(Class clazz) {
        return LoginForm.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        LoginForm loginForm = (LoginForm) target;
        String log = loginForm.getUserName();
        String pass = loginForm.getPassword();

        if (log == null || log.isEmpty()) {
            errors.rejectValue("userName", "notEmpty");
        }

        if (pass == null || pass.isEmpty()) {
            errors.rejectValue("password", "notEmpty");
        } else {
            User user = userDao.getRecords("password", pass);
            if (user == null) {
                errors.rejectValue("password", "Wrong.password");
            } else if (!user.getLogin().equals(log)) {
                errors.rejectValue("userName", "Wrong.userName");
            }
        }
    }
}