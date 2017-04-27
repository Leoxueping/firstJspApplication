package Service;

/**
 * Created by leon on 17/4/17.
 */
public class Message {
    private boolean code = false;
    private String message = "错误";
    public Message() {

    }
    public void setMessage(String message) {
        this.message = message;
    }
    public String getMessage() {
        return this.message;
    }
    public void setCode(boolean code) {
        this.code = code;
    }
    public boolean getCode() {
        return this.code;
    }
}
