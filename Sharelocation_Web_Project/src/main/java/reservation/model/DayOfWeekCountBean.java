package reservation.model;

public class DayOfWeekCountBean {
	private String dayofweek;
	private int count;
	@Override
	public String toString() {
		return "DayOfWeekCountBean [dayofweek=" + dayofweek + ", count=" + count + "]";
	}
	public DayOfWeekCountBean() {
		super();
	}
	public String getDayofweek() {
		return dayofweek;
	}
	public void setDayofweek(String dayofweek) {
		this.dayofweek = dayofweek;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
