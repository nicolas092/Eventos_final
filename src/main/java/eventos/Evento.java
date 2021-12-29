package eventos;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import dao.EventoDAO;
import pessoas.Participante;
import util.Situacao;

@Entity
public class Evento implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "ID_EVENTO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(length = 50, nullable = false)
	private String nome;
	@Column(nullable = false)
	private double taxaInscricao;

	private LocalDateTime data;

	@Enumerated(EnumType.ORDINAL)
	private Situacao situacao;

	@OneToMany // (cascade = CascadeType.PERSIST) comentado pois os registros já foram
				// inseridos manualmente
	private List<Participante> participantes = new ArrayList<>();

	@ManyToOne(cascade = CascadeType.PERSIST)
	private Local local;

	public Evento() {
		super();
	}

	public Evento(String nome, double taxaInscricao, LocalDateTime data, Situacao situacao) {
		super();
		this.nome = nome;
		this.taxaInscricao = taxaInscricao;
		this.data = data;
		this.situacao = situacao;
	}

	public Evento(String nome, double taxaInscricao, LocalDateTime data, Situacao situacao,
			List<Participante> participantes, Local local) {
		super();
		this.nome = nome;
		this.taxaInscricao = taxaInscricao;
		this.data = data;
		this.situacao = situacao;
		this.participantes = participantes;
		this.local = local;
	}

	public boolean validarData() {
		if (this.data.getYear() == 2021)
			return true;
		else
			return false;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getTaxaInscricao() {
		return taxaInscricao;
	}

	public void setTaxaInscricao(double taxaInscricao) {
		this.taxaInscricao = taxaInscricao;
	}

	public LocalDateTime getData() {
		return data;
	}

	public void setData(LocalDateTime data) {
		this.data = data;
	}

	public List<Participante> getParticipantes() {
		return participantes;
	}

	public void setParticipantes(List<Participante> participantes) {
		this.participantes = participantes;
	}

	public Situacao getSituacao() {
		return situacao;
	}

	public void setSituacao(Situacao situacao) {
		this.situacao = situacao;
	}

	public Local getLocal() {
		return local;
	}

	public void setLocal(Local local) {
		this.local = local;
	}

	@Override
	public String toString() {
		String auxParticipantes = "";
		if (participantes != null) {
			for (Participante participante : participantes) {
				if (participante != null)
					auxParticipantes += participante.toString() + "\n";
			}
		}

		String auxLocal = "";
		if (local != null)
			auxLocal += local.toString();
		else
			auxLocal += " local não informado";

		return "EVENTO" + "\nnome = " + nome + ", taxaInscricao = R$" + taxaInscricao + ", data = " + data
				+ ", situacao = " + situacao + "\nLocal" + auxLocal + "\nParticipantes\n"
				+ (auxParticipantes.equals("") ? "nenhum participante informado\n" : auxParticipantes);
	}

	public long persistir() {
		return new EventoDAO().persistir(this);
	}

	public Evento pesquisarPeloNome(String nomeProcurado) {
		return new EventoDAO().pesquisarPeloNome(nomeProcurado);
	}
	
	public List<Evento> buscarTodos() {
		return new EventoDAO().buscarTodos();
	}

	public boolean atualizar() {
		return new EventoDAO().atualizar(this);
	}

	public boolean remover() {
		return new EventoDAO().remover(this.getId());
	}

	public Evento buscarRegistroPorId(long id) {
		return new EventoDAO().buscarRegistroPorId(id);
	}

}
