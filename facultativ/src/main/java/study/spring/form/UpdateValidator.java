package study.spring.form;

import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import study.spring.DAO.CurseDAO;
import study.spring.DAO.UserDAO;
import study.spring.entity.Curse;
import study.spring.entity.User;

import javax.annotation.Resource;

@Service
public class UpdateValidator implements Validator {

    @Resource(name = "userDAO")
    private UserDAO userDAO;
    @Resource(name = "curseDAO")
    private CurseDAO curseDAO;
    private String userPass, operation;

    public void setParameters(String userPass, String operation) {
        this.userPass = userPass;
        this.operation = operation;
    }

    @Override
    public boolean supports(Class clazz) {
        return UpdateForm.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        UpdateForm updateForm = (UpdateForm) target;
        String name = updateForm.getCurseName();
        if (name.isEmpty() || name.matches("\\p{Space}+") || name == null) {
            errors.rejectValue("curseName", "name.empty");
            return;
        }

        User user = userDAO.getRecords("password", userPass);
        switch (operation) {
            case "add":
                try {
                    Curse curse = new Curse();
                    curse.setCurseName(name);
                    curse.setUserId(user);
                    curseDAO.update(curse);
                    errors.rejectValue("curseName", "success.update");
                } catch (DataAccessException d) {
                    errors.rejectValue("curseName", "success.failure");
                }
                break;
            case "delete":
                try {
                    Curse curse = curseDAO.getRecords("curseName", name);
                    if (!curse.getUserId().equals(user)) {
                        errors.rejectValue("curseName", "delete.not");
                        return;
                    }

                    curseDAO.deleteRecords(curse);
                    errors.rejectValue("curseName", "success.deleted");
                } catch (NullPointerException e) {
                    errors.rejectValue("curseName", "delete.failure");
                }
                break;
        }
    }
}