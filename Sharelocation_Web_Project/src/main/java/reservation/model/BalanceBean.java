package reservation.model;

public class BalanceBean {
	private int num;
	private int membernum;
	private String company;
	private String name;
	private String address;
	private String email;
	private String bank;
	private String account;
	
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
	
}
