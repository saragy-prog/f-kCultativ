package study.spring.DAO;

import org.springframework.stereotype.Repository;
import study.spring.entity.Curse;
import study.spring.entity.User;

import java.util.List;

@Repository("userDAO")
public class UserDAO extends BaseDAO<User> {

    public UserDAO() {
        super(User.class);
    }

    /*
     * при задании в Hibernate "жадной" связи между таблицами (см. entity), при
     * обращении к объекту класса User, будет принудительно инициализирован
     * список курсов, относящихся к данному объекту.
     */
    public List<Curse> getCurses(User user) {
        return user.getCurseList();
    }
}