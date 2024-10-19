package br.edu.ifsp.arq.tsi.arqweb2.ifconect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

import javax.sql.DataSource;

import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.Cliente;



public class ClienteDAO {
	private DataSource dataSource;

	public ClienteDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	public Optional<Cliente> getUserByEmailAndCPF(String email, String cpf) {
		
		String sql = "select codigo,name,email from cliente where email=? and cpf=?";
		Optional<Cliente> optional = Optional.empty();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, email);
			ps.setString(2, cpf);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					Cliente cliente = new Cliente();
					cliente.setCodigo(rs.getInt(1));
					cliente.setNome(rs.getString(2));
					cliente.setEmail(rs.getString(3));
					optional = Optional.of(cliente);
				}
			}
			return optional;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro durante a consulta no BD", sqlException);
		}
	}
	
	public Optional<Cliente> getUserByEmail(String email){
		String sql = "select codigo,name,email from cliente where email=?";
		Optional<Cliente> optional = Optional.empty();
		try(Connection conn = dataSource.getConnection(); 
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, email);
			try(ResultSet rs = ps.executeQuery()) {
				if(rs.next()) {
					Cliente cliente = new Cliente();
					cliente.setCodigo(rs.getInt(1));
					cliente.setNome(rs.getString(2));
					cliente.setEmail(rs.getString(3));
					optional = Optional.of(cliente);
				}
			}
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a consulta no BD", e);
		}
		return optional;
	}
	
	public Boolean save(Cliente cliente){
		Optional<Cliente> optional = getUserByEmail(cliente.getEmail());
		if(optional.isPresent()) {
			return false;
		}
		String sql = "insert into cliente (name, email, telefone, "
				+ "cpf) values (?,?,?,?)";
		try(Connection conn = dataSource.getConnection(); 
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, cliente.getNome());
			ps.setString(2, cliente.getEmail());
			ps.setString(3, cliente.getTelefone());
			ps.setString(4, cliente.getCpf());
			ps.executeUpdate();
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a escrita no BD", e);
		}
		return true;
	}
}
