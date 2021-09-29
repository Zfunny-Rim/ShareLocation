package member.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

public class MemberBean {

	private int num;
	@NotNull(message = "아이디 입력하세요") 
	private String id;

	@NotBlank(message = "비밀번호는 필수 입력 값입니다.")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}", message= "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 20자의 비밀번호여야 합니다.")
	private String password;
	@Length(min = 3, message = "3자리이상 입력하세요")
	private String nickname;
	@NotBlank(message = "이메일은 필수 입력 값입니다.")
	@Email(message = "이메일 형식에 맞지 않습니다.")
	private String email;
	@NotBlank(message = "주소 필수 입력 값입니다.")
	private String address;

	private String hp;
	@NotBlank(message = "생일 필수 입력 값입니다.")
	private String birth;
	@NotBlank(message = "성별은 필수 입력 값입니다.")
	private String gender;
	@NotBlank(message = "type 필수 입력 값입니다.")
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
