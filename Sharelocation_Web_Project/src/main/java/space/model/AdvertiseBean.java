package space.model;

public class AdvertiseBean {
	private int num;
	private int spacenum;
	private String applicationdate;
	private String expiredate;
	private int price;
	
	public AdvertiseBean() {
		super();
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
	public String getExpiredate() {
		return expiredate;
	}
	public void setExpiredate(String expiredate) {
		this.expiredate = expiredate;
	}
	public String getApplicationdate() {
		return applicationdate;
	}
	public void setApplicationdate(String applicationdate) {
		this.applicationdate = applicationdate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
