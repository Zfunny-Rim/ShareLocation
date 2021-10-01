package space.model;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class SpaceBean {

	private int num;
	private int membernum;
	@NotBlank(message="이름을 입력하세요.")
	private String name;
	@NotBlank(message="분류를 선택하세요.")
	private String type;
	@NotBlank(message="한줄소개를 입력하세요.")
	private String contentssim;
	@NotBlank(message="공간소개를 입력하세요.")
	private String contentscom;
	@NotBlank(message="대표 이미지를 선택하세요.")
	private String mainimage;
	@NotBlank(message="주의사항을 입력하세요.")
	private String warning;
	private String site;
	@NotBlank(message="주소를 입력하세요.")
	private String address;
	private String email;
	@Pattern(regexp="^\\d{2,3}-\\d{3,4}-\\d{4}$", message="올바른 전화번호 형식을 입력하세요.")
	private String hp;
	private String operatingtime;
	private String holiday;
	private String grade;
	
	//DB에 저장되지 않는 값들
	private MultipartFile mainimagefile;
	private List<MultipartFile> spaceimagefile;
	private List<String> spaceimage;
	@Min(value = 1, message="이미지를 최소 한개 선택해주세요.")
	@Max(value = 5, message="이미지는 최대 5장까지 선택 가능합니다.")
	private int spaceimageCount;
	
	public MultipartFile getMainimagefile() {
		return mainimagefile;
	}
	public void setMainimagefile(MultipartFile mainimagefile) {
		this.mainimagefile = mainimagefile;
		//
		this.setMainimage(mainimagefile.getOriginalFilename());
	}
	public List<MultipartFile> getSpaceimagefile() {
		return spaceimagefile;
	}
	public void setSpaceimagefile(List<MultipartFile> spaceimagefile) {
		this.spaceimagefile = spaceimagefile;
		//
		List<String> sImg = new ArrayList<String>();
		for(MultipartFile mpf:spaceimagefile) {
			if(mpf.getOriginalFilename().length() != 0)
				sImg.add(mpf.getOriginalFilename());
		}
		this.setSpaceimage(sImg);
	}
	public List<String> getSpaceimage() {
		return spaceimage;
	}
	public void setSpaceimage(List<String> spaceimage) {
		this.spaceimage = spaceimage;
		this.setSpaceimageCount(this.spaceimage.size());
	}
	public int getSpaceimageCount() {
		return spaceimageCount;
	}
	public void setSpaceimageCount(int spaceimageCount) {
		this.spaceimageCount = spaceimageCount;
		System.out.println("spaceimageCount : " + spaceimageCount);
	}
	//
	
	
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
				+ ", operatingtime=" + operatingtime + ", holiday=" + holiday + ", grade=" + grade + ", mainimagefile="
				+ mainimagefile + ", spaceimagefile=" + spaceimagefile + "]";
	}

	
}
