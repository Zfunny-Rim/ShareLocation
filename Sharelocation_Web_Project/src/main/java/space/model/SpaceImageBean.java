package space.model;

public class SpaceImageBean {
	private int num;
	private int spacenum;
	private String image;
	
	//»ı¼ºÀÚ
	public SpaceImageBean() {
		super();
	}
	public SpaceImageBean(int num, int spacenum, String image) {
		super();
		this.num = num;
		this.spacenum = spacenum;
		this.image = image;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}
