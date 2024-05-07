package VO;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Builder
@ToString
public class BoardVO {
	private String categoryName;
	private String boardNumber;
	private String boardTitle;
	private String boardContent;
	private String boardInputDate;
	private String adminId;
	private int rnum;
	private int boardViews;
}