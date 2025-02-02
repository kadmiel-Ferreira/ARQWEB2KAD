package model;

public enum Porte {
	PEQUENO("Pequeno"),
	MEDIO("Médio"),
	GRANDE("Grande");
	
	private String description;

	private Porte(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
}
