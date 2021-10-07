package space.model;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class SpaceBean {

	private int num;
	private int membernum;
	@NotBlank(message="�̸��� �Է��ϼ���.")
	private String name;
	@NotBlank(message="�з��� �����ϼ���.")
	private String type;
	@NotBlank(message="���ټҰ��� �Է��ϼ���.")
	private String contentssim;
	@NotBlank(message="�����Ұ��� �Է��ϼ���.")
	private String contentscom;  
	@NotBlank(message="��ǥ �̹����� �����ϼ���.")
	private String mainimage;
	@NotBlank(message="���ǻ����� �Է��ϼ���.")   
	private String warning;
	private String site;
	@NotBlank(message="�ּҸ� �Է��ϼ���.")
	private String address;
	private String email;
	@Pattern(regexp="^\\d{2,3}-\\d{3,4}-\\d{4}$", message="�ùٸ� ��ȭ��ȣ ������ �Է��ϼ���.")
	private String hp;
	private String operatingtime;
	private String operatingendtime;
	private String holiday;
	private String grade;
	private String status;
	private String regdate;
	private String tag;
	
	
	//������
	public SpaceBean() {
		super();
	}

	//DB�� ������� �ʴ� ����
	private MultipartFile mainimagefile;
	private MultipartFile mainimageupdatefile;
	private String mainimageOrigin;
	private List<MultipartFile> spaceimagefile;
	private List<MultipartFile> spaceimageupdatefile;
	private List<String> spaceimage;
	private List<String> spaceimageupdate;
	
	@Min(value = 1, message="�̹����� �ּ� �Ѱ� �������ּ���.")
	@Max(value = 5, message="�̹����� �ִ� 5����� ���� �����մϴ�.")
	private int spaceimageCount;
	private int spaceimageOriginCount;
	
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
	
	//update null issue
	public MultipartFile getMainimageupdatefile() {
		return mainimageupdatefile;
	}
	public void setMainimageupdatefile(MultipartFile mainimageupdatefile) {
		this.mainimageupdatefile = mainimageupdatefile;
		if(mainimageupdatefile.getOriginalFilename().equals("")) {
			this.setMainimage(this.getMainimageOrigin());
		}else {
			this.setMainimage(mainimageupdatefile.getOriginalFilename());
		}
	}
	public List<MultipartFile> getSpaceimageupdatefile() {
		return spaceimageupdatefile;
	}
	public void setSpaceimageupdatefile(List<MultipartFile> spaceimageupdatefile) {
		this.spaceimageupdatefile = spaceimageupdatefile;
		//
		List<String> sImg = new ArrayList<String>();
		for(MultipartFile mpf:spaceimageupdatefile) {
			if(mpf.getOriginalFilename().length() != 0)
				sImg.add(mpf.getOriginalFilename());
		}
		this.setSpaceimageupdate(sImg);
	}
	public List<String> getSpaceimageupdate() {
		return spaceimageupdate;
	}
	public void setSpaceimageupdate(List<String> spaceimageupdate) {
		this.spaceimageupdate = spaceimageupdate;
		//
		if(this.spaceimageupdate.size() == 0) {
			this.setSpaceimageCount(this.getSpaceimageOriginCount());
		}else {
			this.setSpaceimageCount(this.spaceimageupdate.size());
		}
	}
	public String getMainimageOrigin() {
		return mainimageOrigin;
	}
	public void setMainimageOrigin(String mainimageOrigin) {
		this.mainimageOrigin = mainimageOrigin;
	}
	public int getSpaceimageOriginCount() {
		return spaceimageOriginCount;
	}
	public void setSpaceimageOriginCount(int spaceimageOriginCount) {
		this.spaceimageOriginCount = spaceimageOriginCount;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getOperatingendtime() {
		return operatingendtime;
	}
	public void setOperatingendtime(String operatingendtime) {
		this.operatingendtime = operatingendtime;
	}
	@Override
	public String toString() {
		return "SpaceBean \n[num=" + num + ", membernum=" + membernum + ", name=" + name + ", type=" + type
				+ ",\n contentssim=" + contentssim + ", contentscom=" + contentscom + ", mainimage=" + mainimage
				+ ",\n warning=" + warning + ", site=" + site + ", address=" + address + ", email=" + email + ", hp=" + hp
				+ ",\n operatingtime=" + operatingtime + ", operatingendtime=" + operatingendtime + ", holiday=" + holiday
				+ ",\n grade=" + grade + ", status=" + status + ", regdate=" + regdate + ", tag=" + tag
				+ ",\n spaceimageCount=" + spaceimageCount + "]";
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
}