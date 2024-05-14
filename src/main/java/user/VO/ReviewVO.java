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
	private String userId;//사용자id
	private int reviewScore,reviewNumber//리뷰점수 , 리뷰번호
	private String reviewInputDate;//리뷰작성일
	private String reviewContent;//리뷰내용
	private String movieTitle;//영화제목
  private String screeningTime;//상영시간
  private String theaterNumber;//상영관
  private String theaterName;//극장명
  private String moviePosterPath//영화포스터
  private String reservationNumber;//예매번호
  
  Date screeningDate; 

}
