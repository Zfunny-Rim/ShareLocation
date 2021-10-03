package space.model;

public class SpaceFacilityBean {
	private int num;
	private int spacenum;
	private String facility;
	
	//»ı¼ºÀÚ
	public SpaceFacilityBean() {
		super();
	}
	public SpaceFacilityBean(int num, int spacenum, String facility) {
		super();
		this.num = num;
		this.spacenum = spacenum;
		this.facility = facility;
	}
	//Getter Setter
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
	public String getFacility() {
		return facility;
	}
	public void setFacility(String facility) {
		this.facility = facility;
	}
	
	
}
