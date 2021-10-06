package detailspace.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

public class DetailSpaceBean {
	private int num;
	private int spacenum;
	@Length(min=2, max=10, message="이름은 2자에서 10자 사이로 입력하세요.")
	private String name;
	private String type;
	@NotBlank(message="대표이미지를 선택해주세요.")
	private String mainimage;
	@Min(value=1, message="최소 예약시간은 1시간 이상으로 설정해주세요.")
	@Max(value=24, message="최소 예약시간은 24시간 이하로 설정해주세요.")
	private int mintime;
	@Min(value=1, message="최소 인원은 1명 이상으로 설정해주세요.")
	private int minperson;
	@Min(value=1, message="최대 인원은 1명 이상으로 설정해주세요.")
	private int maxperson;
	private String priceunit;
	@Min(value=0, message="가격은 음수를 입력할 수 없습니다.")
	private int price;
	//
	private MultipartFile mainimagefile;
	public MultipartFile getMainimagefile() {
		return mainimagefile;
	}
	public void setMainimagefile(MultipartFile mainimagefile) {
		this.mainimagefile = mainimagefile;
		this.setMainimage(mainimagefile.getOriginalFilename());
	}
	
	public DetailSpaceBean() {
		super();
	}
	public DetailSpaceBean(int num, int spacenum, String name, String type, String mainimage, int mintime,
			int minperson, int maxperson, String priceunit, int price, MultipartFile mainimagefile) {
		super();
		this.num = num;
		this.spacenum = spacenum;
		this.name = name;
		this.type = type;
		this.mainimage = mainimage;
		this.mintime = mintime;
		this.minperson = minperson;
		this.maxperson = maxperson;
		this.priceunit = priceunit;
		this.price = price;
		this.mainimagefile = mainimagefile;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getSpacenum() {
		return spacenum;
	}

	public void setSpacenum(int spacenum) {
		this.spacenum = spacenum;
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

	public String getMainimage() {
		return mainimage;
	}

	public void setMainimage(String mainimage) {
		this.mainimage = mainimage;
	}

	public int getMintime() {
		return mintime;
	}

	public void setMintime(int mintime) {
		this.mintime = mintime;
	}

	public int getMinperson() {
		return minperson;
	}

	public void setMinperson(int minperson) {
		this.minperson = minperson;
	}

	public int getMaxperson() {
		return maxperson;
	}

	public void setMaxperson(int maxperson) {
		this.maxperson = maxperson;
	}

	public String getPriceunit() {
		return priceunit;
	}

	public void setPriceunit(String priceunit) {
		this.priceunit = priceunit;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "DetailSpaceBean [num=" + num + ", spacenum=" + spacenum + ", name=" + name + ", type=" + type
				+ ", mainimage=" + mainimage + ", mintime=" + mintime + ", minperson=" + minperson + ", maxperson="
				+ maxperson + ", priceunit=" + priceunit + ", price=" + price + ", mainimagefile=" + mainimagefile
				+ "]";
	}
	
	
	
}
