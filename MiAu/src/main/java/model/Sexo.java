package model;

public enum Sexo {
	MACHO("Macho"),
	FEMEA("Fêmea");
	
	private String description;

	private Sexo(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
}
