package reservation.model;

import org.hibernate.validator.constraints.NotEmpty;

import detailspace.model.DetailSpaceBean;
import member.model.MemberBean;

public class ReservationBean {
	private int num;
	private int membernum;
	private int spacenum;
	private int detailspacenum;
	@NotEmpty(message = "체크인 선택해주세요")
	private String checkin;
	@NotEmpty(message = "체크아웃 선택해주세요")
	private String checkout;
	@NotEmpty(message = "예약인원 최소 1명이상입니다.")
	private int person;
	private int amounts;
	private String cusrequest;
	private String paymenttype;
	private String applicationdate;
	private String status;
	//
	MemberBean memberBean;
	DetailSpaceBean detailSpaceBean;
	
	public ReservationBean() {
		super();
	}

	public ReservationBean(int num, int membernum, int spacenum, int detailspacenum, String checkin, String checkout,
			int person, int amounts, String cusrequest, String paymenttype, String applicationdate, String status) {
		super();
		this.num = num;
		this.membernum = membernum;
		this.spacenum = spacenum;
		this.detailspacenum = detailspacenum;
		this.checkin = checkin;
		this.checkout = checkout;
		this.person = person;
		this.amounts = amounts;
		this.cusrequest = cusrequest;
		this.paymenttype = paymenttype;
		this.applicationdate = applicationdate;
		this.status = status;
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

	public int getDetailspacenum() {
		return detailspacenum;
	}

	public void setDetailspacenum(int detailspacenum) {
		this.detailspacenum = detailspacenum;
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
	
	public String getPaymenttype() {
		return paymenttype;
	}

	public void setPaymenttype(String paymenttype) {
		this.paymenttype = paymenttype;
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
	
	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public DetailSpaceBean getDetailSpaceBean() {
		return detailSpaceBean;
	}

	public void setDetailSpaceBean(DetailSpaceBean detailSpaceBean) {
		this.detailSpaceBean = detailSpaceBean;
	}

	@Override
	public String toString() {
		return "ReservationBean [num=" + num + ", membernum=" + membernum + ", spacenum=" + spacenum
				+ ", detailspacenum=" + detailspacenum + ", checkin=" + checkin + ", checkout=" + checkout + ", person="
				+ person + ", amounts=" + amounts + ", cusrequest=" + cusrequest + ", paymenttype=" + paymenttype
				+ ", applicationdate=" + applicationdate + ", status=" + status + "]";
	}

}