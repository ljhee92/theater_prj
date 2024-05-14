package user.VO;

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
public class ReviewVO {
	private String userId;
	private int reviewScore;
	private String reviewInputDate;
	private String reviewContent;
	private String movieTitle;
}
