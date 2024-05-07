package admin;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class BoardVO {
	
	private int boardNumber, categoryNumber, boardViews, rnum;
	private String boardTitle, boardContent, categoryName, adminId;
	private Date boardDate;

} // class