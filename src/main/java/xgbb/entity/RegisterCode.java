package xgbb.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author nb
 * @since 2019-07-04
 */
@TableName("register_code")
public class RegisterCode extends Model<RegisterCode> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "email", type = IdType.AUTO)
    private String email;

    private String testCode;


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTestCode() {
        return testCode;
    }

    public void setTestCode(String testCode) {
        this.testCode = testCode;
    }

    @Override
    protected Serializable pkVal() {
        return this.email;
    }

    @Override
    public String toString() {
        return "RegisterCode{" +
        "email=" + email +
        ", testCode=" + testCode +
        "}";
    }
}
