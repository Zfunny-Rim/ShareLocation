package reviewBoard.model;

public class ReviewBoardBean {

	private int num ;
	private int spaceNum;
	private String write;
	private String regDate;
	private String content;
	private int reStep;
	private int reLevel;
	private int serviceRating;
	private int priceValueRation;
	private int cleanRating;
	private int totalRating;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getSpaceNum() {
		return spaceNum;
	}
	public void setSpaceNum(int spaceNum) {
		this.spaceNum = spaceNum;
	}
	public String getWrite() {
		return write;
	}
	public void setWrite(String write) {
		this.write = write;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReStep() {
		return reStep;
	}
	public void setReStep(int reStep) {
		this.reStep = reStep;
	}
	public int getReLevel() {
		return reLevel;
	}
	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}
	public int getServiceRating() {
		return serviceRating;
	}
	public void setServiceRating(int serviceRating) {
		this.serviceRating = serviceRating;
	}
	public int getPriceValueRation() {
		return priceValueRation;
	}
	public void setPriceValueRation(int priceValueRation) {
		this.priceValueRation = priceValueRation;
	}
	public int getCleanRating() {
		return cleanRating;
	}
	public void setCleanRating(int cleanRating) {
		this.cleanRating = cleanRating;
	}
	public int getTotalRating() {
		return totalRating;
	}
	public void setTotalRating(int totalRating) {
		this.totalRating = serviceRating+ priceValueRation +cleanRating;
	}

	
	
}
