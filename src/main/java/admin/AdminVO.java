package admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@ToString
public class AdminVO {
	private String adminId;
	private String adminPwd;
}
