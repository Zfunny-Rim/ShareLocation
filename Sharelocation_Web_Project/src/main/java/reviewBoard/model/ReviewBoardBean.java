package reviewBoard.model;

public class ReviewBoardBean {
	private int num;
	private int spacenum;
	private String write;
	private String regdate;
	private String content;
	private int restep;
	private int relevel;
	private int servicerating;
	private int pricevalueration;
	private int cleanrating;
	private int totalrating;
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
	public String getWrite() {
		return write;
	}
	public void setWrite(String write) {
		this.write = write;
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
		this.totalrating = servicerating+pricevalueration+cleanrating;
	}
	public ReviewBoardBean(int num, int spacenum, String write, String regdate, String content, int restep, int relevel,
			int servicerating, int pricevalueration, int cleanrating, int totalrating) {
		super();
		this.num = num;
		this.spacenum = spacenum;
		this.write = write;
		this.regdate = regdate;
		this.content = content;
		this.restep = restep;
		this.relevel = relevel;
		this.servicerating = servicerating;
		this.pricevalueration = pricevalueration;
		this.cleanrating = cleanrating;
		this.totalrating = totalrating;
	}
	public ReviewBoardBean() {
		super();
	}
	
	
	
}
