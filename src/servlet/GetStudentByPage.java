package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import dao.StudentDao;
import factory.DAOFactory;
import pojo.Student;
import java.util.List;

/**
 * Created by leon on 17-4-27.
 */
public class GetStudentByPage extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        List<Student> all = null;
        try {
            StudentDao iEmpDAOInstance = DAOFactory.getIEmpDAOInstance();
            all = iEmpDAOInstance.findAllByPage(1);
        }catch (Exception e) {
            e.getStackTrace();
        }finally {

        }

        String res = "[";
        for(Student stu : all) {
            res += "{name: " + stu.getStudentName() +
                        ",id: " + stu.getStudentId() +
                        ",sex: " + stu.getStudentSex() +
                        ",major: " + stu.getStudentMajor() +

                    "},";
        }
        String gg = req.getParameter("page");
        out.append(gg);
//        out.flush();
//        out.close();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        doGet(req, resp);
    }
}
