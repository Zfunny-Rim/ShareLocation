package member.model;

public class MemberBean {
	
	private int num;
	private String id;
	private String password;
	private String nickname;
	private String email;
	private String address;
	private String hp;
	private String birth;
	private String gender;
	private String type;
	private String joindate;
	
	public MemberBean() {
		super();
	}

	public MemberBean(int num, String id, String password, String nickname, String email, String address, String hp,
			String birth, String gender, String type, String joindate) {
		super();
		this.num = num;
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.email = email;
		this.address = address;
		this.hp = hp;
		this.birth = birth;
		this.gender = gender;
		this.type = type;
		this.joindate = joindate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	
	
	
}
