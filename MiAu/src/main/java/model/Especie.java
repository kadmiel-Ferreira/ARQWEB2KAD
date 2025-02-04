package model;

public enum Especie {
	CACHORRO("Cachorro"),
	GATO("Gato"),
	OUTRO("Outro");
	
	private String description;
	
	private Especie(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
}
