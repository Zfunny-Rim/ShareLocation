package space.model;

public class SpaceTagBean {
	private int num;
	private int spacenum;
	private String tag;
	
	//»ı¼ºÀÚ
	public SpaceTagBean() {
		super();
	}
	public SpaceTagBean(int num, int spacenum, String tag) {
		super();
		this.num = num;
		this.spacenum = spacenum;
		this.tag = tag;
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
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	
}
