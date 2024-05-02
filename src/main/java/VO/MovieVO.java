package VO;



import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
public class MovieVO {

    private String code;
    private String title;
    private Date releaseDate;
    private String genre;
    private String rating;
    private String director;
    private String distributor;
    private String runningTime;
    private String mainActor;
    private String subActor;
    private String description;
    private String posterPath;
    private char screeningStatus;
    private String inputDate;
	
	

	
}
