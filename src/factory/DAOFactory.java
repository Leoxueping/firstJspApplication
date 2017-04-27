package factory;

/**
 * Created by leon on 17/4/17.
 */
import dao.StudentDao;
import Service.StudentService;

public class DAOFactory {
    public static StudentDao getIEmpDAOInstance() throws Exception {
        return new StudentService();
    }

}