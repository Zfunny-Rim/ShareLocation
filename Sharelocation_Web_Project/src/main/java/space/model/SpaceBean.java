package space.model;

public class SpaceBean {

	private int num;
	private int memberNum;
	private String name;
	private String type;
	private String contentsSim;
	private String contentsCom;
	private String warning;
	private String site;
	private String address;
	private String email;
	private String hp;
	private String operatingTime;
	private String holiday;
	private String grade;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContentsSim() {
		return contentsSim;
	}
	public void setContentsSim(String contentsSim) {
		this.contentsSim = contentsSim;
	}
	public String getContentsCom() {
		return contentsCom;
	}
	public void setContentsCom(String contentsCom) {
		this.contentsCom = contentsCom;
	}
	public String getWarning() {
		return warning;
	}
	public void setWarning(String warning) {
		this.warning = warning;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getOperatingTime() {
		return operatingTime;
	}
	public void setOperatingTime(String operatingTime) {
		this.operatingTime = operatingTime;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public SpaceBean(int num, int memberNum, String name, String type, String contentsSim, String contentsCom,
			String warning, String site, String address, String email, String hp, String operatingTime, String holiday,
			String grade) {
		super();
		this.num = num;
		this.memberNum = memberNum;
		this.name = name;
		this.type = type;
		this.contentsSim = contentsSim;
		this.contentsCom = contentsCom;
		this.warning = warning;
		this.site = site;
		this.address = address;
		this.email = email;
		this.hp = hp;
		this.operatingTime = operatingTime;
		this.holiday = holiday;
		this.grade = grade;
	}
	public SpaceBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
