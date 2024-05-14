package admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AdminReserveManageVO {
	private String reservationNumber;
	private String userId;
	private String movieTitle;
	private String theaterName;
	private String screeningDate;
	private String theaterNumber;
	private String screeningRound;
	private String seatNumber;
	private int totalPeopleNumber;
}
