package admin;

import java.sql.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@ToString
@Getter
@Setter
public class UserVO {

	private String userId;
	private String userPassword;
	private String userName;
	private Date userBirthday;
	private String userPhone;
	private Date userInputDate;
	private char userDeleteFlag;
	
}
