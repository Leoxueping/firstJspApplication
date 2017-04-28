package servlet;

import dao.StudentDao;
import factory.DAOFactory;
import pojo.Student;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by leon on 17-4-27.
 */
public class SearchStudent extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setHeader("Cache-Control", "no-cache");
        String condition = req.getParameter("condition");
        String type = req.getParameter("type");
        PrintWriter out = resp.getWriter();

        List<Student> all = null;
        try {
            StudentDao iEmpDAOInstance = DAOFactory.getIEmpDAOInstance();
            all = iEmpDAOInstance.blurSearchStudent(condition, type);
        }catch (Exception e) {
            e.getStackTrace();
        }finally {

        }

        String res = "[";
        for(Student stu : all) {
            res += "{\"name\": \"" + stu.getStudentName() +
                    "\",\"id\": \"" + stu.getStudentId() +
                    "\",\"sex\": \"" + stu.getStudentSex() +
                    "\",\"major\": \"" + stu.getStudentMajor() +

                    "\"},";
        }
        res += "]";
        out.print(res);
        out.flush();
        out.close();
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
