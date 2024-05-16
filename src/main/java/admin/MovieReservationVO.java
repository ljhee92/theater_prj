package admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@ToString
public class MovieReservationVO {
	private int rank;
	private String movieTitle;
	private int reservationCount;
}
