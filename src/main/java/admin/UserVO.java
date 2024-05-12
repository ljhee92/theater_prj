package admin;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {

	private String userId;
	private String userPassword;
	private String userName;
	private String userBirthday;
	private String userPhone;
	private Date userInputDate;
	private char userDeleteFlag;
	
}
