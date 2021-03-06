package Service;

/**
 * Created by leon on 17/4/17.
 */
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import dao.StudentDao;
import pojo.Student;
import dao.StudentDaoImpl;
import db.DBConnection;

public class StudentService implements StudentDao {
    public StudentService() throws Exception {
    }


    public Message addStudent(Student student) throws Exception {
        Message res = new Message();
        try {
            Connection conn = DBConnection.getConnection();
            StudentDaoImpl daoImpl = new StudentDaoImpl(conn);
            if(daoImpl.findStudentById(student.getStudentId()) != null) {
                res.setMessage("您的学号已存在，请勿重复注册!");
                res.setCode(false);
            }else {
                res = daoImpl.addStudent(student);
            }
            conn.close();
        } catch (Exception e) {
            throw e;
        }finally {
            if (res.getCode()) {
                res.setMessage("注册成功");
            }
        }
        return res;
    }

    @Override
    public Message deleteStudentById(String student_id) throws Exception {
        Message res = new Message();
        try {
            Connection conn = DBConnection.getConnection();
            StudentDaoImpl daoImpl = new StudentDaoImpl(conn);
            if (daoImpl.findStudentById(student_id) != null) {
                res = daoImpl.deleteStudentById(student_id);
            }else {
                res.setCode(false);
                res.setMessage("您的学号不存在，请勿重复删除!");
            }
            conn.close();
        } catch (Exception e) {
            throw e;
        }finally {
        }
        return res;
    }

    @Override
    public List<Student> findAll() throws Exception {
        List<Student> all = null;
        try {
            Connection conn = DBConnection.getConnection();
            StudentDaoImpl daoImpl = new StudentDaoImpl(conn);
            all = daoImpl.findAll();
            conn.close();
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return all;
    }

    @Override
    public List<Student> findAllByPage(int page, int pageSize) throws Exception {
        List<Student> all = null;
        try {
            Connection conn = DBConnection.getConnection();
            StudentDaoImpl daoImpl = new StudentDaoImpl(conn);
            all = daoImpl.findAllByPage(page, pageSize);
            conn.close();
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return all;
    }

    @Override
    public Student findStudentById(String student_id) throws Exception {
        Student student = null;
        try {
            Connection conn = DBConnection.getConnection();
            StudentDaoImpl daoImpl = new StudentDaoImpl(conn);
            student = daoImpl.findStudentById(student_id);
            conn.close();
        } catch (Exception e) {
            throw e;
        }finally {
        }
        return student;
    }

    @Override
    public Message updateStudent(Student student) throws Exception {
        Message res = new Message();
        try {
            Connection conn = DBConnection.getConnection();
            StudentDaoImpl daoImpl = new StudentDaoImpl(conn);
            res = daoImpl.updateStudent(student);
            conn.close();
        } catch (Exception e) {
            res.setCode(false);
            res.setMessage("更新失败，请重试");
            throw e;
        }finally {
        }
        return res;
    }

    @Override
    public List<Student> blurSearchStudent(String condition, String type) throws Exception {
        List<Student> all = null;
        try {
            Connection conn = DBConnection.getConnection();
            StudentDaoImpl daoImpl = new StudentDaoImpl(conn);
            all = daoImpl.blurSearchStudent(condition, type);
            conn.close();
        } catch (Exception e) {
            throw e;
        } finally {
        }
        return all;
    }

}
