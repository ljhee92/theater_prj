package VO;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *  극장VO
 */
@Getter
@Setter
@ToString
@Builder
public class TheaterVO {
    private String theaterName;
    private String theaterNumber;
}