package model;

public enum Raca {
    // Cães
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
    
    // Gatos
    PERSA("Persa"),
    SIAMES("Siamês"),
    MAINE_COON("Maine Coon"),
    SPHYNX("Sphynx"),
    BENGAL("Bengal"),
    BRITISH_SHORTHAIR("British Shorthair"),
    RAGDOLL("Ragdoll"),
    ABISSINIO("Abissínio"),
    SCOTTISH_FOLD("Scottish Fold"),
    BIRMANES("Birmanês"),
    SRD("Sem Raça Definida");
    
    private String description;

    private Raca(String description) {
        this.description = description;
    }
    
    public String getDescription() {
        return description;
    }
}
