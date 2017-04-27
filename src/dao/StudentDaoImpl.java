package dao;

/**
 * Created by leon on 17/4/17.
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Service.Message;

import pojo.Student;
public class StudentDaoImpl implements StudentDao {
    private Connection conn = null;
    private PreparedStatement pstmt = null;

    public StudentDaoImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public Message addStudent(Student student) throws Exception {
        boolean flag = false;
        Message res = new Message();
        String sql = "insert into Student(student_id,student_name,student_major, student_sex) values(?,?,?,?)";
        try {
            this.pstmt = this.conn.prepareStatement(sql);
            this.pstmt.setString(1, student.getStudentId());
            this.pstmt.setString(2, student.getStudentName());
            this.pstmt.setString(3, student.getStudentMajor());
            this.pstmt.setString(4, student.getStudentSex());
            if (this.pstmt.executeUpdate() > 0) {
                flag = true;
            }
            this.pstmt.close();
        }catch (Exception e) {
            throw e;
        }finally {
            this.pstmt = null;
        }
        if (flag) {
            res.setCode(true);
            res.setMessage("添加成功");
        }else {
            res.setCode(false);
            res.setMessage("添加失败");
        }
        return res;

    }

    @Override
    public Message deleteStudentById(String student_id) throws Exception {
        Message res = new Message();
        String sql = "delete from Student where student_id=?";
        try {
            this.pstmt = this.conn.prepareStatement(sql);
            this.pstmt.setString(1, student_id);
            int i = this.pstmt.executeUpdate();
            this.pstmt.close();
            if (i != 0) {
                res.setCode(true);
                res.setMessage("删除成功");
            }else {
                res.setCode(false);
                res.setMessage("删除失败");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            pstmt = null;
        }
        return res;

    }

    @Override
    public List<Student> findAll() throws Exception {
        List<Student> list = new ArrayList<>();
        String sql = "select student_id,student_name,student_major,student_sex from Student";
        try {
            this.pstmt = this.conn.prepareStatement(sql);
            ResultSet rs= this.pstmt.executeQuery();
            while(rs.next()){
                Student student = new Student();
                student.setStudentId(rs.getString(1));
                student.setStudentName(rs.getString(2));
                student.setStudentMajor(rs.getString(3));
                student.setStudentSex(rs.getString(4));
                list.add(student);
            }
            this.pstmt.close();
            rs.close();
        }catch (Exception e) {
            throw e;
        }finally {
            this.pstmt = null;
        }

        return list;
    }

    @Override
    public List<Student> findAllByPage (int page) throws Exception {
        List<Student> list = new ArrayList<>();
        int begin = 10 * (page - 1);
        int end = 10 * (page - 1) + 10;
        String sql = "select student_id,student_name,student_major,student_sex from Student LIMIT ?,?";
        try {
            this.pstmt = this.conn.prepareStatement(sql);
            this.pstmt.setInt(1, begin);
            this.pstmt.setInt(2, end);
            ResultSet rs= this.pstmt.executeQuery();
            while(rs.next()){
                Student student = new Student();
                student.setStudentId(rs.getString(1));
                student.setStudentName(rs.getString(2));
                student.setStudentMajor(rs.getString(3));
                student.setStudentSex(rs.getString(4));
                list.add(student);
            }
            this.pstmt.close();
            rs.close();
        }catch (Exception e) {
            throw e;
        }finally {
            this.pstmt = null;
        }

        return list;
    }

    @Override
    public Student findStudentById(String student_id) throws Exception {
        // TODO Auto-generated method stub
        Student student = null;
        String sql = "select student_id,student_name,student_major, student_sex from Student where student_id = ?";
        try {
            this.pstmt = this.conn.prepareStatement(sql);
            this.pstmt.setString(1, student_id);
            ResultSet rs= this.pstmt.executeQuery();
            if(rs.next()){
                student = new Student();
                student.setStudentId(rs.getString(1));
                student.setStudentName(rs.getString(2));
                student.setStudentMajor(rs.getString(3));
                student.setStudentSex(rs.getString(4));
                rs.close();
            }
            this.pstmt.close();
        }catch (Exception e) {
            throw e;
        }finally {
            this.pstmt = null;
        }
        return student;
    }

    @Override
    public Message updateStudent(Student student) throws Exception {
        Message res = new Message();
        String sql = "UPDATE Student SET student_sex=?, student_name=?, student_major=? WHERE student_id=?;";
        try {
            this.pstmt = this.conn.prepareStatement(sql);
            this.pstmt.setString(1, student.getStudentSex());
            this.pstmt.setString(2, student.getStudentName());
            this.pstmt.setString(3, student.getStudentMajor());
            this.pstmt.setString(4, student.getStudentId());
            int i = this.pstmt.executeUpdate();
            this.pstmt.close();
            if (i != 0) {
                res.setCode(true);
                res.setMessage("更新成功");
            }else {
                res.setCode(false);
                res.setMessage("更新失败");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            pstmt = null;
        }
        return res;

    }

}
