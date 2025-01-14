package model;

public enum Status {

    
    DISPONIVEL("Disponivel"),
    ADOTADO("Adotado");
    
    private String description;

	private Status(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}

}
