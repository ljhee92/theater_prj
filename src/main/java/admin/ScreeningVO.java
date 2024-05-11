package admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ScreeningVO {
	private String screeningCode;
	private int screeningNumber;
	private String theaterName;
	private String theaterNumber;
	private String movieName;
	private String screeningDate;
	private String screeningRound;
}
