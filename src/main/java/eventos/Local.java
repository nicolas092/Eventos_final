package eventos;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import dao.LocalDAO;

@Entity
public class Local implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "ID_LOCAL")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(length = 50, nullable = false)
	private String instituicao;
	@Column(length = 14, nullable = false)
	private String telefone;
	@Column(length = 50, nullable = false)
	private String organizador;

	@OneToMany(mappedBy = "local", cascade = CascadeType.PERSIST)
	private List<Evento> eventos = new ArrayList<>();

	public Local() {
		super();
	}

	public Local(String instituicao, String telefone, String organizador) {
		super();
		this.instituicao = instituicao;
		this.telefone = telefone;
		this.organizador = organizador;
	}

	public Local(String instituicao, String telefone, String organizador, List<Evento> eventos) {
		super();
		this.instituicao = instituicao;
		this.telefone = telefone;
		this.organizador = organizador;
		this.setEventos(eventos);
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getInstituicao() {
		return instituicao;
	}

	public void setInstituicao(String instituicao) {
		this.instituicao = instituicao;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getOrganizador() {
		return organizador;
	}

	public void setOrganizador(String organizador) {
		this.organizador = organizador;
	}

	public List<Evento> getEventos() {
		return eventos;
	}

	public void setEventos(List<Evento> eventos) {
		this.eventos = eventos;
	}

	@Override
	public String toString() {
		String eventos = "";
		if (this.eventos == null) {
			for (int i = 0; i < this.eventos.size(); i++) {
				eventos = eventos.concat(this.eventos.get(i).toString());
			}
		}
		return "instituição = " + instituicao + ", telefone = " + telefone + ", organizador = " + organizador
				+ ", eventos = " + eventos;
	}

	public long persistir() {
		return new LocalDAO().persistir(this);
	}

	public boolean remover() {
		return new LocalDAO().remover(this.getId());
	}

	public boolean atualizar() {
		return new LocalDAO().atualizar(this);
	}

	public Local buscarRegistroPorId(long id) {
		return new LocalDAO().buscarRegistroPorId(id);
	}

	public Local pesquisarPeloNome(String nomeProcurado) {
		return new LocalDAO().pesquisarPeloNome(nomeProcurado);
	}

	public List<Local> buscarTodos() {
		return new LocalDAO().buscarTodos();
	}

}
