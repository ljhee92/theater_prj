package user.VO;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.util.Date;

/**
 * 유저VO
 */
@Builder
@Getter
@ToString
public class UserVO {
    private String userId;
    private String userPassword;
    private String userName;
    private String userBirthday;
    private String userPhone;
    private Date userInputDate;
    private char userDeleteFlag;
    private char userTemporaryFlag;
}