package user.VO;

import java.sql.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@ToString
@Builder
public class UserReservationVO {
	
	String reservationNumber, movieTitle, moviePosterPath,theaterName,theaterNumber,seatLownumber,seatColnumber,screeningTime,paymentMethod;
	int totalPrice;
	Date reservationDate,screeningDate; 
	
    


}
