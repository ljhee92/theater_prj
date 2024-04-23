package VO;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

/**
 * 좌석 VO
 */
@Builder
@Getter
@ToString
public class SeatVO {
    private String seatLowNumber;
    private String seatColNumber;
    private String theaterName;
    private String theaterNumber;
    private char reservationStatus;
}
