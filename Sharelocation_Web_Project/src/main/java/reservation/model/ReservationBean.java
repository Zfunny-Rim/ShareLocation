package reservation.model;

public class ReservationBean {
	private int num;
	private int memberNum;
	private int spaceNum;
	private int detailspaceNum;
	private String checkin;
	private String checkout;
	private int person;
	private int amounts;
	private String cusrequest;
	private String applicationdate;
	private String status;
	
	public ReservationBean() {
		super();
	}

	public ReservationBean(int num, int memberNum, int spaceNum, int detailspaceNum, String checkin, String checkout,
			int person, int amounts, String cusrequest, String applicationdate, String status) {
		super();
		this.num = num;
		this.memberNum = memberNum;
		this.spaceNum = spaceNum;
		this.detailspaceNum = detailspaceNum;
		this.checkin = checkin;
		this.checkout = checkout;
		this.person = person;
		this.amounts = amounts;
		this.cusrequest = cusrequest;
		this.applicationdate = applicationdate;
		this.status = status;
	}

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

	public int getSpaceNum() {
		return spaceNum;
	}

	public void setSpaceNum(int spaceNum) {
		this.spaceNum = spaceNum;
	}

	public int getDetailspaceNum() {
		return detailspaceNum;
	}

	public void setDetailspaceNum(int detailspaceNum) {
		this.detailspaceNum = detailspaceNum;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public int getAmounts() {
		return amounts;
	}

	public void setAmounts(int amounts) {
		this.amounts = amounts;
	}

	public String getCusrequest() {
		return cusrequest;
	}

	public void setCusrequest(String cusrequest) {
		this.cusrequest = cusrequest;
	}

	public String getApplicationdate() {
		return applicationdate;
	}

	public void setApplicationdate(String applicationdate) {
		this.applicationdate = applicationdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
