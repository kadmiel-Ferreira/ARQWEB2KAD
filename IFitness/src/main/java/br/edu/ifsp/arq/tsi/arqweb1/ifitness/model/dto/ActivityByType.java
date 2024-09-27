package br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.dto;

public class ActivityByType {

	private String type;
	private Integer count;

	public ActivityByType(String type, Integer count) {
		this.type = type;
		this.count = count;
	}
	
	public ActivityByType() {
	}

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
