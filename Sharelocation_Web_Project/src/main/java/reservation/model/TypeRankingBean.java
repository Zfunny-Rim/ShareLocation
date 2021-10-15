package reservation.model;

public class TypeRankingBean {
	private String type;
	private int count;
	public TypeRankingBean() {
		super();
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "TypeRankingBean [type=" + type + ", count=" + count + "]";
	}
	
}
