package dao;


import java.util.List;
import pojo.Student;
import Service.Message;

/**
 * Created by leon on 17/4/17.
 */
public interface StudentDao {
    Message addStudent(Student student) throws Exception ;
    Message deleteStudentById(String student_id) throws Exception;
    List<Student> findAll() throws Exception;
    List<Student> findAllByPage(int page, int pageSize) throws Exception;
    List<Student> blurSearchStudent(String condition, String type) throws Exception;
    Student findStudentById(String student_id) throws Exception;
    Message updateStudent(Student student) throws Exception;
}
