package helpBoard.model;
import org.hibernate.validator.constraints.NotBlank;


public class HelpBoardBean {

 private int num; 
	private int membernum; 
	@NotBlank(message="필수 입력사항입니다.")
	private String category;
	private String writer; 
	private String regdate; 
	@NotBlank(message="필수 입력사항입니다.")
	private String title; 
	@NotBlank(message="필수 입력사항입니다.")
	private String content;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMembernum() {
		return membernum;
	}
	public void setMembernum(int membernum) {
		this.membernum = membernum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	@Override
	public String toString() {
		return "HelpBoardBean [num=" + num + ", membernum=" + membernum + ", category=" + category + ", writer="
				+ writer + ", regdate=" + regdate + ", title=" + title + ", content=" + content + "]";
	}
	public void setContent(String content) {
		this.content = content;
	}
	public HelpBoardBean(int num, int membernum, String category, String writer, String regdate, String title,
			String content) {
		super();
		this.num = num;
		this.membernum = membernum;
		this.category = category;
		this.writer = writer;
		this.regdate = regdate;
		this.title = title;
		this.content = content;
	}
	public HelpBoardBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
