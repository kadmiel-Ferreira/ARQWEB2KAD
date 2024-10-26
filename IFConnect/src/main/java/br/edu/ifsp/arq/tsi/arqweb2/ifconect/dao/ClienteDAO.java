package br.edu.ifsp.arq.tsi.arqweb2.ifconect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.sql.DataSource;

import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.Cliente;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.Endereco;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.FormaPagamento;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.OrdemServico;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.Status;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.utils.DataSourceSearcher;



public class ClienteDAO {
	private DataSource dataSource;

	public ClienteDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	public ClienteDAO() {
        this.dataSource = DataSourceSearcher.getInstance().getDataSource();
    }
	
	public Optional<Cliente> getUserByEmailAndCPF(Integer id) {
		
		String sql = "select id,nome from cliente where id=?";
		Optional<Cliente> optional = Optional.empty();
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					Cliente cliente = new Cliente();
					cliente.setCodigo(rs.getInt(1));
					cliente.setNome(rs.getString(2));
					optional = Optional.of(cliente);
				}
			}
			return optional;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro durante a consulta no BD2", sqlException);
		}
	}
	
	public Optional<Cliente> getUserByEmail(String email){
		String sql = "select id,nome,email from cliente where email=?";
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
		String sql = "insert into Cliente (nome, email, telefone, cpf, rua, cidade, estado, cep) "
	               + "values (?, ?, ?, ?, ?, ?, ?, ?)";
		try(Connection conn = dataSource.getConnection(); 
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setString(1, cliente.getNome());
			ps.setString(2, cliente.getEmail());
			ps.setString(3, cliente.getTelefone());
			ps.setString(4, cliente.getCpf());
			ps.setString(5, cliente.getEndereco().getRua());
	        ps.setString(6, cliente.getEndereco().getCidade());
	        ps.setString(7, cliente.getEndereco().getEstado());
	        ps.setString(8, cliente.getEndereco().getCep());
	        ps.executeUpdate();
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a escrita no BD", e);
		}
		return true;
	}
	
	
	public List<Cliente> listarClientes() throws SQLException {
	    List<Cliente> clientes = new ArrayList<>();
	    String sql = "SELECT * FROM Cliente"; 

	    
	    try (Connection conn = dataSource.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	      
	        while (rs.next()) {
	            Cliente cliente = new Cliente();
	            cliente.setCodigo(rs.getInt("id"));
	            cliente.setNome(rs.getString("nome"));
	            cliente.setEmail(rs.getString("email"));
	            cliente.setTelefone(rs.getString("telefone"));
	            cliente.setCpf(rs.getString("cpf"));

	           
	            Endereco endereco = new Endereco();
	            endereco.setRua(rs.getString("rua"));
	            endereco.setCidade(rs.getString("cidade"));
	            endereco.setEstado(rs.getString("estado"));
	            endereco.setCep(rs.getString("cep"));
	            cliente.setEndereco(endereco);

	            
	            clientes.add(cliente);
	        }
	    }

	    return clientes;
	}
	
}
