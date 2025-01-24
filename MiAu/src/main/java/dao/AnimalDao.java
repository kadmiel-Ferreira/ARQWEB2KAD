package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import model.Animal;
import model.Especie;
import model.Raca;
import model.Sexo;
import model.Status;
import model.Usuario;

public class AnimalDao {

	private DataSource dataSource;

	public AnimalDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public List<Animal> listAnimal() {
		List<Animal> animais = new ArrayList<>();
		String sql = "SELECT a.id, a.nome, a.especie, a.raca, a.sexo, a.status FROM animal a";

		try (Connection con = dataSource.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			while (rs.next()) {
				Animal animal = new Animal();
				animal.setId(rs.getLong("id"));
				animal.setNome(rs.getString("nome"));
				animal.setEspecie(Especie.valueOf(rs.getString("especie")));
				animal.setRaca(Raca.valueOf(rs.getString("raca")));
				animal.setSexo(Sexo.valueOf(rs.getString("sexo")));
				animal.setStatus(Status.valueOf(rs.getString("status")));

				animais.add(animal);
			}
			return animais;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao listar animais", e);
		}
	}
	
	public List<Animal> getAnimalsByUser(Usuario user) {
		String sql = "select * from animal where usuarioId=?";
		List<Animal> animais = new ArrayList<>();
		//String sql = "SELECT a.id, a.nome, a.especie, a.raca, a.sexo, a.status FROM animal a";
		
		try (Connection con = dataSource.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)){
				ps.setLong(1, user.getId());
			try (ResultSet rs = ps.executeQuery()){

				while (rs.next()) {
					Animal animal = new Animal();
					animal.setId(rs.getLong("id"));
					animal.setNome(rs.getString("nome"));
					animal.setEspecie(Especie.valueOf(rs.getString("especie")));
					animal.setRaca(Raca.valueOf(rs.getString("raca")));
					animal.setSexo(Sexo.valueOf(rs.getString("sexo")));
					animal.setStatus(Status.valueOf(rs.getString("status")));
	
					animais.add(animal);
				}
			}	
			return animais;
		} catch (SQLException e) {
			throw new RuntimeException("Erro ao listar animais", e);
		}
	}
	
	public Animal findById(Long id) {
	    String sql = "select a.id, a.nome, a.especie, a.raca, a.idade, a.sexo, a.porte, a.castrado, a.status, a.descricao, u.telefone "
	    		+ "from animal a "
	    		+ "inner join usuario u on a.usuarioId = u.id WHERE a.id = ?";
	    Animal animal = null;

	    try (Connection conn = dataSource.getConnection(); 
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        // Define o parâmetro da consulta
	        ps.setLong(1, id);

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                animal = new Animal();
	                animal.setId(rs.getLong("id"));
	                animal.setNome(rs.getString("nome"));
	                animal.setEspecie(Especie.valueOf(rs.getString("especie")));
	                animal.setRaca(Raca.valueOf(rs.getString("raca")));
	                animal.setIdade(rs.getInt("idade"));
	                animal.setSexo(Sexo.valueOf(rs.getString("sexo")));
	                animal.setPorte(model.Porte.valueOf(rs.getString("porte")));
	                animal.setCastrado(rs.getBoolean("castrado"));
	                animal.setStatus(Status.valueOf(rs.getString("status")));
	                animal.setDescricao(rs.getString("descricao"));
	                animal.setTelefone(rs.getString("telefone"));
	            }
	        }
	    } catch (SQLException e) {
	        throw new RuntimeException("Erro ao buscar o animal com ID: " + id, e);
	    }

	    return animal;
	}

	public Boolean salvar(Animal animal) throws Exception {
		// SQL para inserir os dados do usuário
		String sql = "INSERT INTO animal (usuarioId, nome, especie, raca, idade, sexo, porte, castrado, status, descricao) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		// Conexão com o banco
		try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

			// Setando os valores no SQL
			ps.setLong(1, animal.getUserId());
			ps.setString(2, animal.getNome());
			ps.setString(3, animal.getEspecie().name());
			ps.setString(4, animal.getRaca().name());
			ps.setInt(5, animal.getIdade());
			ps.setString(6, animal.getSexo().name());
			ps.setString(7, animal.getPorte().name());
			ps.setBoolean(8, animal.isCastrado());
			ps.setString(9, animal.getStatus().name());
			ps.setString(10, animal.getDescricao());
			
			
			// Executa a inserção
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new RuntimeException("Erro durante a escrita no BD", e);
		}
	}

	public boolean delete(Animal animal) {
		String sql = "DELETE FROM animal WHERE id = ?";

		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setLong(1, animal.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao remover dados", sqlException);
		}
	}

	

	public boolean update(Animal animal) {
		String sql = "UPDATE animal SET nome = ?, especie = ?, raca = ?, idade = ?, sexo = ?, porte = ?, castrado = ?, status = ?, descricao = ? WHERE id = ?";

		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
				 ps.setString(1, animal.getNome());
		        ps.setString(2, animal.getEspecie().name());
		        ps.setString(3, animal.getRaca().name());
		        ps.setInt(4, animal.getIdade());
		        ps.setString(5, animal.getSexo().name());
		        ps.setString(6, animal.getPorte().name());
		        ps.setBoolean(7, animal.isCastrado());
		        ps.setString(8, animal.getStatus().name());
		        ps.setString(9, animal.getDescricao());
		        ps.setLong(10, animal.getId());
				ps.executeUpdate();
				return true;

		} catch (SQLException e) {
			throw new RuntimeException("Erro ao atualizar animal", e);
		}

	}

	/*
	 * private void preencherPreparedStatementAnimal(PreparedStatement ps, String
	 * nome, String genero, Status status) throws SQLException { ps.setString(1,
	 * nome); ps.setString(2, String.valueOf(status)); ps.setString(3, genero);
	 * 
	 * }
	 */

}