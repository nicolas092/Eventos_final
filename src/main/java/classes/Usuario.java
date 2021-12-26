package classes;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import dao.UsuarioDAO;

@Entity
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
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

	public Long getId() {
		return id;
	}

//	public void setId(Long id) { // em teoria nao deve ser possivel setar id
//		this.id = id;
//	}

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

	public boolean autenticar() {
		return new UsuarioDAO().autenticar(this);
	}

	public long salvar() {
		return new UsuarioDAO().salvar(this);
	}

	public List<Usuario> buscarTodos() {
		return new UsuarioDAO().buscarTodos();
	}

	public boolean atualizar() {
		return new UsuarioDAO().atualizar(this);
	}

	public boolean remover() {
		return new UsuarioDAO().remover(this.getId());
	}

	public Usuario buscarRegistroPorId() {
		return new UsuarioDAO().buscarRegistroPorId(this.getId());
	}
}
