package db;

/**
 * Created by leon on 17/4/17.
 */
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private static final String Driver = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/students?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWORD = "root";
    private static Connection conn = null;

    public static Connection getConnection() throws Exception{
        try {
            Class.forName(Driver);
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            throw e;
        }finally {
            return conn;
        }
    }

    public void close() throws Exception {
        if(this.conn != null){
            try {
                this.conn.close();
            } catch (Exception e) {
                throw e;
            }
        }
    }





}
