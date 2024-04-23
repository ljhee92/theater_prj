package VO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

/**
 * 관리자계정 VO
 * 빌더패턴 사용 X
 */
@AllArgsConstructor
@Getter
@ToString
public class AdminVO {
    private String adminId;
    private String adminPwd;
}