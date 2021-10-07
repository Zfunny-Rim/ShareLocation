package detailspace.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

public class DetailSpaceBean {
	private int num;
	private int spacenum;
	@Length(min=2, max=10, message="�̸��� 2~10�ڷ� �Է��ϼ���")
	private String name;
	private String contents;
	private String type;
	@NotBlank(message="�̹����� ������ּ���")
	private String mainimage;
	@Min(value=1, message="�ּ� ����ð��� 1�ð� �̻����� �������ּ���.")
	private Integer mintime;
	@Min(value=1, message="�ּ� �ο��� 1�� �̻����� �������ּ���.")
	private Integer minperson;
	@Min(value=1, message="�ִ� �ο��� 1�� �̻����� �������ּ���.")
	private Integer maxperson;
	private String priceunit;
	@NotNull(message="������ �Է����ּ���.")
	private Integer price;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public Integer getMintime() {
		return mintime;
	}
	public void setMintime(Integer mintime) {
		this.mintime = mintime;
	}
	public Integer getMinperson() {
		return minperson;
	}
	public void setMinperson(Integer minperson) {
		this.minperson = minperson;
	}
	public Integer getMaxperson() {
		return maxperson;
	}
	public void setMaxperson(Integer maxperson) {
		this.maxperson = maxperson;
	}
	public String getPriceunit() {
		return priceunit;
	}
	public void setPriceunit(String priceunit) {
		this.priceunit = priceunit;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "DetailSpaceBean [num=" + num + ", spacenum=" + spacenum + ", name=" + name + ", contents=" + contents
				+ ", type=" + type + ", mainimage=" + mainimage + ", mintime=" + mintime + ", minperson=" + minperson
				+ ", maxperson=" + maxperson + ", priceunit=" + priceunit + ", price=" + price + ", mainimagefile="
				+ mainimagefile + "]";
	}
	
	
	
	
}
