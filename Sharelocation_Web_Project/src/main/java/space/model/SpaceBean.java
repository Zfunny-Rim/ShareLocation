package space.model;

public class SpaceBean {

	private int num;
	private int membernum;
	private String name;
	private String type;
	private String contentssim;
	private String contentscom;
	private String mainimage;
	private String warning;
	private String site;
	private String address;
	private String email;
	private String hp;
	private String operatingtime;
	private String holiday;
	private String grade;
	

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
	public String getContentssim() {
		return contentssim;
	}
	public void setContentssim(String contentssim) {
		this.contentssim = contentssim;
	}
	public String getContentscom() {
		return contentscom;
	}
	public void setContentscom(String contentscom) {
		this.contentscom = contentscom;
	}
	public String getMainimage() {
		return mainimage;
	}
	public void setMainimage(String mainimage) {
		this.mainimage = mainimage;
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
	public String getOperatingtime() {
		return operatingtime;
	}
	public void setOperatingtime(String operatingtime) {
		this.operatingtime = operatingtime;
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
	public SpaceBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "SpaceBean [num=" + num + ", membernum=" + membernum + ", name=" + name + ", type=" + type
				+ ", contentssim=" + contentssim + ", contentscom=" + contentscom + ", mainimage=" + mainimage
				+ ", warning=" + warning + ", site=" + site + ", address=" + address + ", email=" + email + ", hp=" + hp
				+ ", operatingtime=" + operatingtime + ", holiday=" + holiday + ", grade=" + grade + "]";
	}
	
}
