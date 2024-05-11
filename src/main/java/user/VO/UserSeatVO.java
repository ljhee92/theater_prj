package user.VO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 좌석 VO
 */
@Builder
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Setter
public class UserSeatVO {
    private String seatLowNumber;
    private String seatColNumber;
    private String theaterName;
    private String theaterNumber;
    private String reservationStatus;
}
