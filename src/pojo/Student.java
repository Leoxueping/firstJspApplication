package pojo;

/**
 * Created by leon on 17/4/17.
 */
import java.io.Serializable;

public class Student implements Serializable{

    private static final long serialVersionUID = 1L;
    private String student_id;
    private String student_name;
    private String student_major;
    private String student_sex;

    public Student(){

    }

    public void setStudentId(String student_id) {
        this.student_id = student_id;
    }

    public String getStudentId() {
        return student_id;
    }

    public void setStudentMajor(String student_major) {
        this.student_major = student_major;
    }

    public String getStudentMajor() {
        return student_major;
    }

    public void setStudentName(String student_name) {
        this.student_name = student_name;
    }

    public String getStudentName() {
        return student_name;
    }

    public void setStudentSex(String student_sex) {
        this.student_sex = student_sex;
    }

    public String getStudentSex() {
        return this.student_sex;
    }


}
