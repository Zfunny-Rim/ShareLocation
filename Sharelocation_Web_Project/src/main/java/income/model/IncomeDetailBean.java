package income.model;

import java.util.List;

import space.model.AdvertiseBean;
import space.model.SpaceBean;

public class IncomeDetailBean {
	private final double FIXED_CLEAN_RATIO = 0.01;
	private final double FIXED_MAINTENANCE_RATIO = 0.01;
	private final double FIXED_TAX_RATIO = 0.1;
	private final double FIXED_FEES_RATIO = 0.3;
	//
	private SpaceBean spaceBean;
	private int year;
	private int month;
	//
	private List<IncomeBean> rentalIncomeList;
	private int totalRentalIncomePrice;
	private List<IncomeBean> etcIncomeList;
	private int totalEtcIncomePrice;
	private int totalIncomePrice;
	//
	private int cleanExpensePrice;
	private int maintenanceExpensePrice;
	private int taxExpensePrice;
	private int feesExpensePrice;
	private int totalFixedExpensePrice;
	//
	private AdvertiseBean advertiseBean;
	private int advertiseExpensePrice;
	//
	private List<IncomeBean> etcExpenseList;
	private int totalEtcExpensePrice;
	private int totalExpensePrice;
	//
	private int totalProfit;
	private int profitPerRental;
	
	
	public SpaceBean getSpaceBean() {
		return spaceBean;
	}
	public void setSpaceBean(SpaceBean spaceBean) {
		this.spaceBean = spaceBean;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public List<IncomeBean> getRentalIncomeList() {
		return rentalIncomeList;
	}
	public void setRentalIncomeList(List<IncomeBean> rentalIncomeList) {
		this.rentalIncomeList = rentalIncomeList;
	}
	public int getTotalRentalIncomePrice() {
		return totalRentalIncomePrice;
	}
	public void setTotalRentalIncomePrice(int totalRentalIncomePrice) {
		this.totalRentalIncomePrice = totalRentalIncomePrice;
	}
	public List<IncomeBean> getEtcIncomeList() {
		return etcIncomeList;
	}
	public void setEtcIncomeList(List<IncomeBean> etcIncomeList) {
		this.etcIncomeList = etcIncomeList;
	}
	public int getTotalEtcIncomePrice() {
		return totalEtcIncomePrice;
	}
	public void setTotalEtcIncomePrice(int totalEtcIncomePrice) {
		this.totalEtcIncomePrice = totalEtcIncomePrice;
	}
	public int getTotalIncomePrice() {
		return totalIncomePrice;
	}
	public void setTotalIncomePrice(int totalIncomePrice) {
		this.totalIncomePrice = totalIncomePrice;
	}
	//
	public int getCleanExpensePrice() {
		return cleanExpensePrice;
	}
	public void setCleanExpensePrice(int totalRentalIncomePrice) {
		this.cleanExpensePrice = (int) (totalRentalIncomePrice * this.FIXED_CLEAN_RATIO);
	}
	public int getMaintenanceExpensePrice() {
		return maintenanceExpensePrice;
	}
	public void setMaintenanceExpensePrice(int totalRentalIncomePrice) {
		this.maintenanceExpensePrice = (int) (totalRentalIncomePrice * this.FIXED_MAINTENANCE_RATIO);
	}
	public int getTaxExpensePrice() {
		return taxExpensePrice;
	}
	public void setTaxExpensePrice(int totalRentalIncomePrice) {
		this.taxExpensePrice = (int) (totalRentalIncomePrice * this.FIXED_TAX_RATIO);
	}
	public int getFeesExpensePrice() {
		return feesExpensePrice;
	}
	public void setFeesExpensePrice(int totalRentalIncomePrice) {
		this.feesExpensePrice = (int) (totalRentalIncomePrice * this.FIXED_FEES_RATIO);
	}
	
	public int getTotalFixedExpensePrice() {
		return totalFixedExpensePrice;
	}
	public void setTotalFixedExpensePrice() {
		this.totalFixedExpensePrice = this.cleanExpensePrice + this.maintenanceExpensePrice
				+ this.taxExpensePrice + this.feesExpensePrice;
	}
	//
	public AdvertiseBean getAdvertiseBean() {
		return advertiseBean;
	}
	public void setAdvertiseBean(AdvertiseBean advertiseBean) {
		this.advertiseBean = advertiseBean;
	}
	public int getAdvertiseExpensePrice() {
		return advertiseExpensePrice;
	}
	public void setAdvertiseExpensePrice(int advertiseExpensePrice) {
		this.advertiseExpensePrice = advertiseExpensePrice;
	}
	public List<IncomeBean> getEtcExpenseList() {
		return etcExpenseList;
	}
	public void setEtcExpenseList(List<IncomeBean> etcExpenseList) {
		this.etcExpenseList = etcExpenseList;
	}
	public int getTotalEtcExpensePrice() {
		return totalEtcExpensePrice;
	}
	public void setTotalEtcExpensePrice(int totalEtcExpensePrice) {
		this.totalEtcExpensePrice = totalEtcExpensePrice;
	}
	
	public int getTotalExpensePrice() {
		return totalExpensePrice;
	}
	public void setTotalExpensePrice() {
		this.totalExpensePrice = this.totalFixedExpensePrice + this.totalEtcExpensePrice;
	}
	public int getTotalProfit() {
		return totalProfit;
	}
	public void setTotalProfit(int totalProfit) {
		this.totalProfit = totalProfit;
	}
	public int getProfitPerRental() {
		return profitPerRental;
	}
	public void setProfitPerRental() {
		this.profitPerRental = this.totalProfit / this.rentalIncomeList.size();
	}
	
}
