package reservation.model;


import org.hibernate.validator.constraints.NotBlank;

public class BalanceBean {
	private int num;
	private int membernum;
	@NotBlank(message="상호명을 입력하세요.")
	private String company;
	@NotBlank(message="대표자명을 입력하세요.")
	private String name;
	@NotBlank(message="사업장 주소를 입력하세요.")
	private String address;
	@NotBlank(message="이메일을 입력하세요.")
	private String email;
	@NotBlank(message="은행을 선택하세요.")
	private String bank;
	@NotBlank(message="계좌번호를 입력하세요.")
	private String account;
	@NotBlank(message="연락처를 입력하세요.")
	private String call;
	
	public BalanceBean() {
		super();
	}
	public BalanceBean(int num, int membernum, String company, String name, String address, String email, String bank,
			String account) {
		super();
		this.num = num;
		this.membernum = membernum;
		this.company = company;
		this.name = name;
		this.address = address;
		this.email = email;
		this.bank = bank;
		this.account = account;
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
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getCall() {
		return call;
	}
	public void setCall(String call) {
		this.call = call;
	}
	@Override
	public String toString() {
		return "BalanceBean [num=" + num + ", membernum=" + membernum + ", company=" + company + ", name=" + name
				+ ", address=" + address + ", email=" + email + ", bank=" + bank + ", account=" + account + ", call="
				+ call + "]";
	}
}