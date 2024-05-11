package user.VO;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReservationVO {
	
	private String reservationNumber, userId, screeningCode, seat, seatLowNumber, seatColNumber, theaterName, theaterNumber;
	private Date reservationDate;

} // class