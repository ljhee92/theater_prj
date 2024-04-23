package VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

/**
 *  극장VO
 *  빌더패턴 사용 X
 */
@AllArgsConstructor
@Getter
@ToString
public class TheaterVO {
    private String theaterName;
    private String theaterNumber;
}