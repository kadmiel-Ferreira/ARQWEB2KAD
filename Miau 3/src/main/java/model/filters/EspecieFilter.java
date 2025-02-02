package model.filters;

import java.time.LocalDate;

import model.Especie;
import model.Usuario;

public class EspecieFilter {
	private Usuario user;
	private Especie especie;
	private LocalDate initialDate;
	private LocalDate finalDate;
	
	public Especie getEspecie() {
		return especie;
	}
	
	public void setEspecie(Especie especie) {
		this.especie = especie;
	}
	
	public LocalDate getInitialDate() {
		return initialDate;
	}

	public void setInitialDate(LocalDate initialDate) {
		this.initialDate = initialDate;
	}

	public LocalDate getFinalDate() {
		return finalDate;
	}

	public void setFinalDate(LocalDate finalDate) {
		this.finalDate = finalDate;
	}
	
	public Usuario getUser() {
		return user;
	}

	public void setUser(Usuario user) {
		this.user = user;
	}
}