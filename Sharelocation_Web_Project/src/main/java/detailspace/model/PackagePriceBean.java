package detailspace.model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

public class PackagePriceBean {
	private int num;
	private int detailspacenum;
	@NotBlank(message="��Ű������ �Է��ϼ���.")
	private String title;
	@NotNull(message="���۽ð��� �Է��ϼ���.")
	private Integer checkintime;
	@NotNull(message="����ð��� �Է��ϼ���.")
	private Integer checkouttime;
	@NotNull(message="������ �Է��ϼ���.")
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
