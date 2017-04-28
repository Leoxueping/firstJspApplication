package dao;

/**
 * Created by leon on 17/4/17.
 */
import java.util.List;

import pojo.Student;
import Service.Message;

public class StudentService implements StudentDao {

    @Override
    public Message addStudent(Student student) throws Exception {
        return null;
    }

    @Override
    public List<Student> findAll() throws Exception {
        return null;
    }

    @Override
    public List<Student> findAllByPage(int page, int pageSize) throws Exception {
        return null;
    }

    @Override
    public Message deleteStudentById(String stuId) throws Exception {
        return null;
    }

    @Override
    public Student findStudentById(String student_id) throws Exception {
        return null;
    }

    @Override
    public Message updateStudent(Student student) throws Exception {
        return null;
    }

    @Override
    public List<Student> blurSearchStudent(String condition, String type) throws Exception {
        return null;
    }

}

