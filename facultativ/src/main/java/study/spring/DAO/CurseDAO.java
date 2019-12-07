package study.spring.DAO;

import org.springframework.stereotype.Repository;
import study.spring.entity.Curse;

@Repository("curseDAO")
public class CurseDAO extends BaseDAO<Curse> {

    public CurseDAO() {
        super(Curse.class);
    }
}