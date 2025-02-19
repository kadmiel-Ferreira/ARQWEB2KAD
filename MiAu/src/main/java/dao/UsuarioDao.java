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
        
    	String sql = "INSERT INTO usuario (tipo_usuario, nome, email, senha, telefone, cpf, cnpj, logradouro, numero, complemento, bairro, cep, cidade, estado) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, usuario.getTipoUsuario());
            ps.setString(2, usuario.getNome());
            ps.setString(3, usuario.getEmail());
            ps.setString(4, usuario.getSenha());
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

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao cadastrar usuário no BD", e);
        }
    }

        
        public Optional<Usuario> getUserByEmail(String email) {
            String sql = "SELECT id FROM usuario WHERE email = ?";
            
            try (Connection con = dataSource.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, email);
                
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        Usuario user = new Usuario();
                        user.setId(rs.getLong("id"));
                        return Optional.of(user);
                    }
                }
                
                return Optional.empty();
            } catch (SQLException sqlException) {
                throw new RuntimeException("Erro durante a consulta no BD", sqlException);
            }
        }


        
        public Optional<Usuario> getUserByEmailAndPassword(String email, String password) {
    		String passwordEncripted = EncriptadorDeSenha.encode(password);
    		
    		String sql = "select id,nome,email, tipo_usuario, telefone, logradouro, numero, complemento, bairro, cep, cidade, estado from usuario where email=? and senha=?";
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
    					user.setTipoUsuario(rs.getString(4));
    					user.setTelefone(rs.getString(5));
    					user.setLogradouro(rs.getString(6));
    	            	user.setNumero(rs.getString(7));
    	            	user.setComplemento(rs.getString(8));
    	            	user.setBairro(rs.getString(9));
    	            	user.setCep(rs.getString(10));
    	            	user.setCidade(rs.getString(11));
    	            	user.setEstado(rs.getString(12));
    					optional = Optional.of(user);
    				}
    			}
    			return optional;
    		} catch (SQLException sqlException) {
    			throw new RuntimeException("Erro durante a consulta no BD", sqlException);
    		}
    	}
        
        
        
        public Usuario getUserById(Long id) {
            String sql = "SELECT id, nome, email, tipo_usuario, telefone, logradouro, numero, complemento, bairro, cep, cidade, estado FROM usuario WHERE id=?";
            
            try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setLong(1, id);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        Usuario user = new Usuario();
                        user.setId(rs.getLong(1));
                        user.setNome(rs.getString(2));
                        user.setEmail(rs.getString(3));
                        user.setTipoUsuario(rs.getString(4));
                        user.setTelefone(rs.getString(5));
                        user.setLogradouro(rs.getString(6));
                        user.setNumero(rs.getString(7));
                        user.setComplemento(rs.getString(8));
                        user.setBairro(rs.getString(9));
                        user.setCep(rs.getString(10));
                        user.setCidade(rs.getString(11));
                        user.setEstado(rs.getString(12));
                        return user;
                    } else {
                        throw new RuntimeException("Usuário com ID " + id + " não encontrado.");
                    }
                }
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

    
    
    
    
    public boolean update(Usuario usuario) {
        String sql = "UPDATE usuario SET nome=?, email=?, senha=?, telefone=?, cpf=?, cnpj=?, logradouro=?, numero=?, complemento=?, bairro=?, cep=?, cidade=?, estado=? WHERE id=?";
        
        try (Connection conn = dataSource.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usuario.getNome());
            ps.setString(2, usuario.getEmail());
            ps.setString(3, usuario.getSenha());
            ps.setString(4, usuario.getTelefone());
            
            // Se for Adotante, inclui CPF, caso contrário, inclui CNPJ
            if ("ADOTANTE".equals(usuario.getTipoUsuario())) {
                ps.setString(5, usuario.getCpf());
                ps.setString(6, null); // CNPJ será nulo
            } else if ("ONG".equals(usuario.getTipoUsuario())) {
                ps.setString(5, null); // CPF será nulo
                ps.setString(6, usuario.getCnpj());
            }
            
            ps.setString(7, usuario.getLogradouro());
            ps.setString(8, usuario.getNumero());
            ps.setString(9, usuario.getComplemento());
            ps.setString(10, usuario.getBairro());
            ps.setString(11, usuario.getCep());
            ps.setString(12, usuario.getCidade());
            ps.setString(13, usuario.getEstado());
            ps.setLong(14, usuario.getId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar usuário", e);
        }
    }




}