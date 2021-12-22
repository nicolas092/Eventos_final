package classes;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idUsuario;
	private String email;
	private String senha;

	public Usuario() {
	}

	public Usuario(String email, String senha) {
		super();
		this.email = email;
		this.senha = senha;
	}

	@Override
	public String toString() {
		return "Usuario [email=" + email + ", senha=" + senha + "]";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

//	@Override
//	public String toString() {
//		return "Pessoa [nome=" + nome + ", endereco=" + endereco + "]" + idPessoa;
//	}
//
//	public boolean salvar() {
//		return new PessoaDAO().salvar(this);
//	}
//
//	public List<Pessoa> buscarTodos() {
//		return new PessoaDAO().buscarTodos();
//	}
//
//	public boolean atualizar() {
//		return new PessoaDAO().atualizar(this);
//	}
//
//	public boolean remover() {
//		return new PessoaDAO().remover(this.getIdPessoa());
//	}
//
//	public Pessoa buscarID() {
//		return new PessoaDAO().buscarID(this.getIdPessoa());
//	}
}
