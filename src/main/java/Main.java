import com.mini_zira.db.HibernateConfig;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class Main {
    public static void main(String[] args) {
        SessionFactory sessionFactory =  HibernateConfig.getSessionFactory();
        Session session = sessionFactory.openSession();

        Transaction tx = session.beginTransaction();
//        session.save()

        tx.commit();


        System.out.println(sessionFactory.getClass().getName());
    }
}
