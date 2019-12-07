package study.spring.init;

import java.util.Properties;
import javax.sql.DataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.lookup.JndiDataSourceLookup;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.annotation.AnnotationSessionFactoryBean;

@Configuration
public class DBConfig {
    @Bean
    public DataSource dataSource() {
        final JndiDataSourceLookup dsLookup = new JndiDataSourceLookup();
        DataSource dataSource = dsLookup.getDataSource("java:comp/env/dbusers");
        return dataSource;
    }

    @Bean
    public SessionFactory sessionFactory() {
        AnnotationSessionFactoryBean factoryBean = null;
        try {
            factoryBean = new AnnotationSessionFactoryBean();
            factoryBean.setDataSource(dataSource());
            factoryBean.setPackagesToScan(new String[]{"study.spring.entity"});
            Properties pp = new Properties();
            pp.setProperty("hibernate.dialect", "org.hibernate.dialect.HSQLDialect");
            pp.setProperty("hibernate.show_sql", "true");            
            factoryBean.setHibernateProperties(pp);
			//Оборачивает данный SessionFactory в прокси, если требуется. 
			//Реализация по умолчанию просто возвращает данный SessionFactory
            factoryBean.afterPropertiesSet();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return factoryBean.getObject();
    }
    //Вспомогательный класс, который упрощает код доступа к данным Hibernate.
    @Bean
    public HibernateTemplate hibernateTemplate() {
        return new HibernateTemplate(sessionFactory());
    }
}