package br.edu.ifsp.arq.tsi.arqweb2.ifconect.model;

import java.util.Objects;

public class Cliente {
    private int codigo;
    private String nome;
    private String email;
    private String telefone;
    private String cpf;
    
    
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	@Override
	public int hashCode() {
		return Objects.hash(codigo);
	}
 
}
