package model;

public enum Status {

    
    DISPONIVEL("DISPONIVEL"),
    ADOTADO("ADOTADO");
    
    private String description;

	private Status(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}

}
