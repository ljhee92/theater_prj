package admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
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
	private String theaterNumber;
	private String screeningDate;
	private String screeningTime;
	private String seatNumber;
	private int totalPeopleNumber;
}   
