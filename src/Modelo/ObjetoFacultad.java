package Modelo;

public class ObjetoFacultad {

    private String idFacultad;
    private String nombreFacultad;

    public String getIdFacultad() {
        return idFacultad;
    }

    public void setIdFacultad(String idFacultad) {
        this.idFacultad = idFacultad;
    }

    public String getNombreFacultad() {
        return nombreFacultad;
    }

    public void setNombreFacultad(String nombreFacultad) {
        this.nombreFacultad = nombreFacultad;
    }
    
    public String toString() {
        return this.nombreFacultad;
    }
}