package noticeBoard.model;


import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;


public class NoticeBoardBean {

 private int num; 
	private int membernum; 
	@NotBlank(message="필수 입력사항입니다.")
	private String subject;
	private String writer; 
	private String regdate; 
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public NoticeBoardBean(int num, int membernum, String subject, String writer, String regdate, String content) {
		super();
		this.num = num;
		this.membernum = membernum;
		this.subject = subject;
		this.writer = writer;
		this.regdate = regdate;
		this.content = content;
	}
	public NoticeBoardBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "NoticeBoardBean [num=" + num + ", membernum=" + membernum + ", subject=" + subject + ", writer="
				+ writer + ", regdate=" + regdate + ", content=" + content + "]";
	} 
	
	

}
