package space.model;

public class SpaceCommentBean {
	private int num;
	private int membernum;
	private int spacenum;
	private String writer;
	private String content;
	private String regdate;
	private int replynum;
	
	private SpaceCommentBean replyComment;
	
	public SpaceCommentBean() {
		super();
	}

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

	public int getSpacenum() {
		return spacenum;
	}

	public void setSpacenum(int spacenum) {
		this.spacenum = spacenum;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getReplynum() {
		return replynum;
	}

	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}

	public SpaceCommentBean getReplyComment() {
		return replyComment;
	}

	public void setReplyComment(SpaceCommentBean replyComment) {
		this.replyComment = replyComment;
	}

	@Override
	public String toString() {
		return "SpaceCommentBean [num=" + num + ", membernum=" + membernum + ", spacenum=" + spacenum + ", writer="
				+ writer + ", content=" + content + ", regdate=" + regdate + ", replynum=" + replynum
				+ ", replyComment=" + replyComment + "]";
	}
	
	
}
