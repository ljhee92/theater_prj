package VO;


import lombok.Builder;
import lombok.Getter;

import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
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
	private String movieScore;
}
