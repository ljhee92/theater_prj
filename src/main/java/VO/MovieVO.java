package VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MovieVO {
	private String movieCode;
	private String movieTitle;
	private String movieReleaseDate;
	private String movieGenre;
	private String movieRating;
	private String movieDirector;
	private String movieDistributor;
	private String movieRunningTime;
	private String movieMainActor;
	private String movieSubActor;
	private String movieDescription;
	private String moviePosterPath;
	private String movieScreeningStatus;
	private String movieInputDate;
}
