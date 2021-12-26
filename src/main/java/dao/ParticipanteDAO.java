package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import pessoas.Participante;

public class ParticipanteDAO {
	EntityManager em;

	public ParticipanteDAO() {
	}

	public long persistir(Participante participante) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.persist(participante);
			em.getTransaction().commit();
			return participante.getId();
		} catch (Exception e) {
			if (em.getTransaction().isActive())
				em.getTransaction().rollback();
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public boolean remover(long id) {
		try {
			em = JPAUtil.getEntityManager();
			Participante participante = em.find(Participante.class, id);
			if (participante == null) {
				System.out.println("Participante com id " + id + " não encontrado na base de dados");
				return false;
			} else {
				em.getTransaction().begin();
				em.remove(participante);
				em.getTransaction().commit();
				return true;
			}
		} catch (Exception e) {
			if (em.getTransaction().isActive())
				em.getTransaction().rollback();
			System.out.println(e.getMessage());
			return false;
		}
	}

	public boolean atualizar(Participante participante) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.merge(participante);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			if (em.getTransaction().isActive())
				em.getTransaction().rollback();
			System.out.println(e.getMessage());
			return false;
		}
	}

	public List<Participante> buscarTodos() {
		try {
			em = JPAUtil.getEntityManager();
			String jpql = "select p from Participante p";
			TypedQuery<Participante> query = em.createQuery(jpql, Participante.class);
			List<Participante> participantes = query.getResultList();
			return participantes;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public Participante buscarRegistroPorId(long id) {
		try {
			em = JPAUtil.getEntityManager();
			return em.find(Participante.class, id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public Participante pesquisarPeloNome(String nomeProcurado) {
		try {
			em = JPAUtil.getEntityManager();
			String jpql = "select p from Participante p where lower(p.nome) like :nomeProcurado";
			TypedQuery<Participante> query = em.createQuery(jpql, Participante.class);
			query.setParameter("nomeProcurado", "%".concat(nomeProcurado.toLowerCase()).concat("%"));
			List<Participante> locais = query.getResultList();
			if (locais.size() == 0) {
				System.out.println("Nenhum participante com nome \"" + nomeProcurado + "\" encontrada");
				return null;
			} else if (locais.size() == 1) {
				return locais.get(0);
			} else {
				System.out.println("Localizado mais de um participante com nome \"" + nomeProcurado + "\"");
				return locais.get(0);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
}
