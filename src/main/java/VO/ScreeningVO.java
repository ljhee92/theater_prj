package VO;

import lombok.AllArgsConstructor;
import lombok.Builder;

@Builder
@AllArgsConstructor
public class ScreeningVO {
	private String theaterName;
	private String theaterNumber;
	private String movieName;
	private String screeningDate;
	private String ScreeningRound;
}
