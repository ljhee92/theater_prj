package admin;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@AllArgsConstructor
@Getter
@Setter
public class ScreeningVO {
	private int screeningNumber;
	private String theaterName;
	private String theaterNumber;
	private String movieName;
	private String screeningDate;
	private String screeningRound;
}
