package detailspace.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

public class PackagePriceBean {
	private int num;
	private int detailspacenum;
	@NotBlank(message="패키지명을 입력하세요.")
	private String title;
	@NotNull(message="시작시간을 입력하세요.")
	private Integer checkintime;
	@NotNull(message="종료시간을 입력하세요.")
	private Integer checkouttime;
	@NotNull(message="가격을 입력하세요.")
	private Integer price;
	
	public PackagePriceBean() {
		super();
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getDetailspacenum() {
		return detailspacenum;
	}
	public void setDetailspacenum(int detailspacenum) {
		this.detailspacenum = detailspacenum;
	}
	public Integer getCheckintime() {
		return checkintime;
	}
	public void setCheckintime(Integer checkintime) {
		this.checkintime = checkintime;
	}
	public Integer getCheckouttime() {
		return checkouttime;
	}
	public void setCheckouttime(Integer checkouttime) {
		this.checkouttime = checkouttime;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "PackagePriceBean [num=" + num + ", detailspacenum=" + detailspacenum + ", title=" + title
				+ ", checkintime=" + checkintime + ", checkouttime=" + checkouttime + ", price=" + price + "]";
	}
	
	
}