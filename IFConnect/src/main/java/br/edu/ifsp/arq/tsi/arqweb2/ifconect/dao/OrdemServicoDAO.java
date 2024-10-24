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
		System.out.println("TEEEEEEEEEESTEEEEEEEEEEEE");
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
		System.out.println("TEEEEEEEEEESTEEEEEEEEEEEE");
        List<OrdemServico> ordens = new ArrayList<>();
        String sql = "SELECT os.id, os.descricao, os.status, os.data_criacao, os.data_conclusao, "
                   + "c.nome as cliente_nome, fp.descricao as forma_pagamento "
                   + "FROM OrdemServico os "
                   + "JOIN Cliente c ON os.cliente_id = c.id "
                   + "JOIN FormaPagamento fp ON os.forma_pagamento_id = fp.id";

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
                System.out.println("TEEEEEEEEEESTEEEEEEEEEEEE");
                ordens.add(ordem);
            }
        }

        return ordens;
    }
}
