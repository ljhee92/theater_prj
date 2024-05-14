package user.VO;

import java.sql.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
@Builder
@Setter
public class ReviewVO {
	String reservationNumber, movieTitle, moviePosterPath,theaterName,theaterNumber,screeningTime,reviewContent;
	int reviewNumber,reviewScore;

	Date screeningDate; 

}
