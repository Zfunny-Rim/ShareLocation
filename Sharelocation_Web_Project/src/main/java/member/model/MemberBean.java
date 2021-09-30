package member.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

public class MemberBean {

	private int num;
	@NotNull(message = "���̵� �Է��ϼ���") 
	private String id;

	@NotBlank(message = "��й�ȣ�� �ʼ� �Է� ���Դϴ�.")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}", message= "��й�ȣ�� ���� ��,�ҹ��ڿ� ����, Ư����ȣ�� ��� 1�� �̻� ���Ե� 8�� ~ 20���� ��й�ȣ���� �մϴ�.")
	private String password;
	@Length(min = 3, message = "3�ڸ��̻� �Է��ϼ���")
	private String nickname;
	@NotBlank(message = "�̸����� �ʼ� �Է� ���Դϴ�.")
	@Email(message = "�̸��� ���Ŀ� ���� �ʽ��ϴ�.")
	private String email;
	@NotBlank(message = "�ּ� �ʼ� �Է� ���Դϴ�.")
	private String address;

	private String hp;
	@NotBlank(message = "���� �ʼ� �Է� ���Դϴ�.")
	private String birth;
	@NotBlank(message = "������ �ʼ� �Է� ���Դϴ�.")
	private String gender;
	@NotBlank(message = "type �ʼ� �Է� ���Դϴ�.")
	private String type;
	private int point;	
	private String joindate;
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
	public String getAdress() {
		return address;
	}
	public void setAdress(String adress) {
		this.address = adress;
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public MemberBean(int num, String id, String password, String nickname, String email, String address, String hp,
			String birth, String gender, String type, int point, String joindate) {
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
		this.point = point;
		this.joindate = joindate;
	}
	public MemberBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
