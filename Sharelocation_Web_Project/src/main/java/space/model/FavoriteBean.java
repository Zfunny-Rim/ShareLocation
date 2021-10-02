package space.model;

public class FavoriteBean {
	private int num;
	private int spaceNum;
	private int memberNum;
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
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public FavoriteBean(int num, int spaceNum, int memberNum) {
		super();
		this.num = num;
		this.spaceNum = spaceNum;
		this.memberNum = memberNum;
	}
	public FavoriteBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
