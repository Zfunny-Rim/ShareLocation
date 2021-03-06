package reviewBoard.model;

import space.model.SpaceBean;

public class ReviewBoardBean {
	private int num;
	private int spacenum;
	private int membernum;
	private String writer;
	private String regdate;
	private String content;
	private int ref;
	private int restep;
	private int relevel;
	private int servicerating;
	private int pricevalueration;
	private int cleanrating;
	private int totalrating;
	
	private ReviewBoardBean reviewReply;
	private SpaceBean spaceBean;
	
	public SpaceBean getSpaceBean() {
		return spaceBean;
	}
	public void setSpaceBean(SpaceBean spaceBean) {
		this.spaceBean = spaceBean;
	}
	public ReviewBoardBean getReviewReply() {
		return reviewReply;
	}
	public void setReviewReply(ReviewBoardBean reviewReply) {
		this.reviewReply = reviewReply;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getSpacenum() {
		return spacenum;
	}
	public void setSpacenum(int spacenum) {
		this.spacenum = spacenum;
	}
	public int getMembernum() {
		return membernum;
	}
	public void setMembernum(int membernum) {
		this.membernum = membernum;
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
	public int getServicerating() {
		return servicerating;
	}
	public void setServicerating(int servicerating) {
		this.servicerating = servicerating;
	}
	public int getPricevalueration() {
		return pricevalueration;
	}
	public void setPricevalueration(int pricevalueration) {
		this.pricevalueration = pricevalueration;
	}
	public int getCleanrating() {
		return cleanrating;
	}
	public void setCleanrating(int cleanrating) {
		this.cleanrating = cleanrating;
	}
	public int getTotalrating() {
		return totalrating;
	}
	public void setTotalrating(int totalrating) {
		this.totalrating = totalrating;
	}
	public ReviewBoardBean(int num, int spacenum, int membernum, String writer, String regdate, String content, int ref,
			int restep, int relevel, int servicerating, int pricevalueration, int cleanrating, int totalrating) {
		super();
		this.num = num;
		this.spacenum = spacenum;
		this.membernum = membernum;
		this.writer = writer;
		this.regdate = regdate;
		this.content = content;
		this.ref = ref;
		this.restep = restep;
		this.relevel = relevel;
		this.servicerating = servicerating;
		this.pricevalueration = pricevalueration;
		this.cleanrating = cleanrating;
		this.totalrating = totalrating;
	}
	public ReviewBoardBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ReviewBoardBean [num=" + num + ", spacenum=" + spacenum + ", membernum=" + membernum + ", writer="
				+ writer + ", regdate=" + regdate + ", content=" + content + ", ref=" + ref + ", restep=" + restep
				+ ", relevel=" + relevel + ", servicerating=" + servicerating + ", pricevalueration=" + pricevalueration
				+ ", cleanrating=" + cleanrating + ", totalrating=" + totalrating + ", reviewReply=" + reviewReply
				+ "]";
	}
	
}
