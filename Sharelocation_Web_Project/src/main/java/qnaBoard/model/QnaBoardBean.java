package qnaBoard.model;

public class QnaBoardBean {
	private int num;
	private int membernum;
	private String subject;
	private String writer;
	private String type;
	private String content;
	private String regdate;
	private int ref;
	private int restep;
	private int relevel;
	private int readcount;
	
	public QnaBoardBean() {
		super();
	}

	public QnaBoardBean(int num, int membernum, String subject, String writer, String type, String content,
			String regdate, int ref, int restep, int relevel, int readcount) {
		super();
		this.num = num;
		this.membernum = membernum;
		this.subject = subject;
		this.writer = writer;
		this.type = type;
		this.content = content;
		this.regdate = regdate;
		this.ref = ref;
		this.restep = restep;
		this.relevel = relevel;
		this.readcount = readcount;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRestep() {
		return restep;
	}

	public void setRestep(int restep) {
		this.restep = restep;
	}

	public int getRelevel() {
		return relevel;
	}

	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
	
}
