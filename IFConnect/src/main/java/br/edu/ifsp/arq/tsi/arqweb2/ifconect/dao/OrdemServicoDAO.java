package br.edu.ifsp.arq.tsi.arqweb2.ifconect.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.Cliente;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.FormaPagamento;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.OrdemServico;
import br.edu.ifsp.arq.tsi.arqweb2.ifconect.model.Status;

public class OrdemServicoDAO {
	private DataSource dataSource;
	
	public OrdemServicoDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	public Boolean save(OrdemServico ordemservico){
//		Optional<Cliente> optional = getUserByEmail(cliente.getEmail());
//		if(optional.isPresent()) {
//			return false;
//		}
		String sql = "insert into ordemservico (cliente_id, forma_pagamento_id, status, "
				+ "descricao, data_criacao) values (?, ?, ?, ?, ?)";
		try(Connection conn = dataSource.getConnection(); 
				PreparedStatement ps = conn.prepareStatement(sql)){
			ps.setInt(1, ordemservico.getCliente().getCodigo());
			ps.setInt(2, ordemservico.getFormapagamento().getId());
			ps.setString(3, ordemservico.getStatus().name());
			ps.setString(4, ordemservico.getDescricao());
			ps.setDate(5, Date.valueOf(ordemservico.getDataCriacao()) );
			ps.executeUpdate();
		}catch (SQLException e) {
			throw new RuntimeException("Erro durante a escrita no BD", e);
		}
		return true;
	}
	
	public List<OrdemServico> listarOrdens() throws SQLException {
        List<OrdemServico> ordens = new ArrayList<>();
        String sql = "SELECT os.id, os.descricao, os.status, os.data_criacao, os.data_conclusao, "
                   + "c.nome as cliente_nome, fp.descricao as forma_pagamento "
                   + "FROM OrdemServico os "
                   + "JOIN Cliente c ON os.cliente_id = c.id "
                   + "JOIN FormaPagamento fp ON os.forma_pagamento_id = fp.id "
                   + "ORDER BY os.status";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                OrdemServico ordem = new OrdemServico();
                ordem.setId(rs.getInt("id"));
                ordem.setDescricao(rs.getString("descricao"));
                ordem.setStatus(Status.valueOf(rs.getString("status")));
                ordem.setDataCriacao(rs.getDate("data_criacao").toLocalDate());
                if (rs.getDate("data_conclusao") != null) {
                    ordem.setDataConclusao(rs.getDate("data_conclusao").toLocalDate());
                }
                
                
                Cliente cliente = new Cliente();
                cliente.setNome(rs.getString("cliente_nome"));
                ordem.setCliente(cliente);

                FormaPagamento formaPagamento = new FormaPagamento();
                formaPagamento.setDescricao(rs.getString("forma_pagamento"));
                ordem.setFormapagamento(formaPagamento);
                ordens.add(ordem);
            }
        }

        return ordens;
    }
	
	public OrdemServico getOrdemServicoById(Integer id) {
	    String sql = "SELECT os.id AS ordem_id, "
	               + "       c.id AS cliente_id, "
	               + "       c.nome AS cliente_nome, "
	               + "       os.forma_pagamento_id, "
	               + "       os.status, "
	               + "       os.descricao, "
	               + "       os.data_criacao, "
	               + "       os.data_conclusao "
	               + "FROM OrdemServico os "
	               + "INNER JOIN Cliente c ON os.cliente_id = c.id "
	               + "WHERE os.id = ?";
	    
	    OrdemServico ordemServico = null;

	    try (Connection con = dataSource.getConnection(); 
	         PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, id);

	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                ordemServico = new OrdemServico();
	                ordemServico.setId(rs.getInt("ordem_id"));
	                
	                Cliente cliente = new Cliente();
	                cliente.setCodigo(rs.getInt("cliente_id"));
	                cliente.setNome(rs.getString("cliente_nome"));
	                ordemServico.setCliente(cliente);

	                FormaPagamento formaPagamento = new FormaPagamento();
	                formaPagamento.setId(rs.getInt("forma_pagamento_id"));
	                ordemServico.setFormapagamento(formaPagamento);

	                ordemServico.setStatus(Status.valueOf(rs.getString("status")));
	                ordemServico.setDescricao(rs.getString("descricao"));
	                ordemServico.setDataCriacao(rs.getDate("data_criacao").toLocalDate());

	                if (rs.getDate("data_conclusao") != null) {
	                    ordemServico.setDataConclusao(rs.getDate("data_conclusao").toLocalDate());
	                }
	            }
	        }
	    } catch (SQLException sqlException) {
	        throw new RuntimeException("Erro durante a consulta ao obter a Ordem de Serviço", sqlException);
	    }

	    return ordemServico;
	}

	
	
	
	public Boolean update(OrdemServico ordemServico) {
		String sql = "update ordemservico set status = ?, descricao = ?, data_conclusao = ? WHERE id = ?";
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, ordemServico.getStatus().name());
			ps.setString(2, ordemServico.getDescricao());
			ps.setDate(2, Date.valueOf(ordemServico.getDataConclusao()));
			
			ps.executeUpdate();
			return true;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao atualizar dados", sqlException);
		}
	}
	
	public Boolean delete(OrdemServico ordemServico) {
		String sql = "delete from ordemservico where id=?";
		try (Connection con = dataSource.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setLong(1, ordemServico.getId());
			ps.executeUpdate();
			return true;
		} catch (SQLException sqlException) {
			throw new RuntimeException("Erro ao remover dados", sqlException);
		}
	}
	
}
