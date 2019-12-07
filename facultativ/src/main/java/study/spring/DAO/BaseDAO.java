package study.spring.DAO;

import java.util.List;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

public abstract class BaseDAO<T> {
    @Autowired
    protected HibernateTemplate template;
    protected Class<T> type;
    
    protected BaseDAO(Class<T> type) {
        this.type = type;
    }
    
    public final <E> T getRecords(String property, E criterion) {
        //создает критерии, не привязанные к сессии (в отличии от session.createCriteria())
        DetachedCriteria criteria = DetachedCriteria.forClass(type).add(Restrictions.eq(property, criterion));
        List<T> list = template.findByCriteria(criteria);
        return (list.isEmpty()) ? null : list.get(0);
    }
    
    public final List<T> getAllRecords() {
        List<T> curses = template.loadAll(type);
        return curses;
    }
    
    public final void update(T c) {
        template.saveOrUpdate(c);
    }

    public final void deleteRecords(T c) {
        template.delete(c);
    } 
}