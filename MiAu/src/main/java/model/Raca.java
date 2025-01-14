package model;

public enum Raca {
	LABRADOR("Labrador Retriever"),
    GOLDEN_RETRIEVER("Golden Retriever"),
    PASTOR_ALEMAO("Pastor Alemão"),
    PUG("Pug"),
    SHIH_TZU("Shih Tzu"),
    BULLDOG("Bulldog"),
    ROTTWEILER("Rottweiler"),
    BEAGLE("Beagle"),
    BORDER_COLLIE("Border Collie"),
    DALMATA("Dálmata"),
    CHIHUAHUA("Chihuahua"),
    YORKSHIRE("Yorkshire Terrier"),
    PITBULL("Pitbull"),
    SRD("Sem Raça Definida");
	
	private String description;

	private Raca(String description) {
		this.description = description;
	}
	
	public String getDescription() {
		return description;
	}
}
