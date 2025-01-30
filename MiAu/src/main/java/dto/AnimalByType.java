package dto;

public class AnimalByType {
	private String type;
	private Integer count;
	
	public AnimalByType(String type, Integer count) {
		this.type = type;
		this.count = count;
	}
	
	public AnimalByType() {}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
}
