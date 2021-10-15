package income.model;

public class IncomeBean {
	private int num;
	private int membernum;
	private int spacenum;
	private String type;
	private String category;
	private int price;
	private String incomdate;
	private String note;
	private int reservationnum;
	private int advertisenum;
	
	public IncomeBean() {
		super();
	}
	
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
	public int getSpacenum() {
		return spacenum;
	}
	public void setSpacenum(int spacenum) {
		this.spacenum = spacenum;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getIncomdate() {
		return incomdate;
	}
	public void setIncomdate(String incomdate) {
		this.incomdate = incomdate;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getReservationnum() {
		return reservationnum;
	}
	public void setReservationnum(int reservationnum) {
		this.reservationnum = reservationnum;
	}
	public int getAdvertisenum() {
		return advertisenum;
	}
	public void setAdvertisenum(int advertisenum) {
		this.advertisenum = advertisenum;
	}

	@Override
	public String toString() {
		return "IncomeBean [num=" + num + ", membernum=" + membernum + ", spacenum=" + spacenum + ", type=" + type
				+ ", category=" + category + ", price=" + price + ", incomdate=" + incomdate + ", note=" + note
				+ ", reservationnum=" + reservationnum + ", advertisenum=" + advertisenum + "]";
	}
	
	
}
