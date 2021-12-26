package pessoas;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

import dao.PessoaDAO;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Pessoa implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "ID_PESSOA")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(length = 50, nullable = false)
	private String nome;

	public Pessoa() {
		super();
	}

	public Pessoa(String nome) {
		super();
		this.nome = nome;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public String toString() {
		return "Nome = " + nome;
	}

	public long persistir() {
		return new PessoaDAO().persistir(this);
	}

	public boolean remover() {
		return new PessoaDAO().remover(this.getId());
	}

	public boolean atualizar() {
		return new PessoaDAO().atualizar(this);
	}

	public Pessoa buscarRegistroPorId(long id) {
		return new PessoaDAO().buscarRegistroPorId(id);
	}

	public Pessoa pesquisarPeloNome(String nomeProcurado) {
		return new PessoaDAO().pesquisarPeloNome(nomeProcurado);
	}

	public List<Pessoa> buscarTodos() {
		return new PessoaDAO().buscarTodos();
	}

}
