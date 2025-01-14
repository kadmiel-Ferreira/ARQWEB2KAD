package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

import javax.sql.DataSource;

import model.Usuario;
import utils.EncriptadorDeSenha;
public class UsuarioDao {

    private DataSource dataSource;

    public UsuarioDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }


        public Boolean salvar(Usuario usuario) throws Exception {
            // SQL para inserir os dados do usuário
            String sql = "INSERT INTO usuario (tipo_usuario, nome, email, senha, telefone, cpf, cnpj, logradouro, numero, complemento, bairro, cep, cidade, estado) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Conexão com o banco
            try(Connection conn = dataSource.getConnection(); 
    				PreparedStatement ps = conn.prepareStatement(sql)){

                // Setando os valores no SQL
            	ps.setString(1, usuario.getTipoUsuario());
            	ps.setString(2, usuario.getNome());
            	ps.setString(3, usuario.getEmail());
            	ps.setString(4, usuario.getSenha()); // Senha deve ser hasheada
            	ps.setString(5, usuario.getTelefone());
            	ps.setString(6, usuario.getCpf());
            	ps.setString(7, usuario.getCnpj());
            	ps.setString(8, usuario.getLogradouro());
            	ps.setString(9, usuario.getNumero());
            	ps.setString(10, usuario.getComplemento());
            	ps.setString(11, usuario.getBairro());
            	ps.setString(12, usuario.getCep());
            	ps.setString(13, usuario.getCidade());
            	ps.setString(14, usuario.getEstado());

                // Executa a inserção
            	ps.executeUpdate();
            	return true;
            }catch (SQLException e) {
    			throw new RuntimeException("Erro durante a escrita no BD", e);
    		}
        }
        
        
        public Optional<Usuario> getUserByEmailAndPassword(String email, String password) {
    		String passwordEncripted = EncriptadorDeSenha.encode(password);
    		
    		String sql = "select id,nome,email from usuario where email=? and senha=?";
    		Optional<Usuario> optional = Optional.empty();
    		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
    			ps.setString(1, email);
    			ps.setString(2, passwordEncripted);
    			try (ResultSet rs = ps.executeQuery()) {
    				if (rs.next()) {
    					Usuario user = new Usuario();
    					user.setId(rs.getLong(1));
    					user.setNome(rs.getString(2));
    					user.setEmail(rs.getString(3));
    					optional = Optional.of(user);
    				}
    			}
    			return optional;
    		} catch (SQLException sqlException) {
    			throw new RuntimeException("Erro durante a consulta no BD", sqlException);
    		}
    	}
        

    public void delete(int id) {
        String sqlUser = "DELETE FROM user WHERE id = ?";
        String sqlEndereco = "DELETE FROM endereco WHERE id = ?";

        try (Connection con = dataSource.getConnection()) {
            try (PreparedStatement psEndereco = con.prepareStatement(sqlEndereco)) {
                psEndereco.setInt(1, id);
                psEndereco.executeUpdate();
            }

            try (PreparedStatement psCliente = con.prepareStatement(sqlUser)) {
                psCliente.setInt(1, id);
                psCliente.executeUpdate();
            }

        } catch (SQLException e) {
            throw new RuntimeException("Erro ao excluir cliente", e);
        }
    }





}