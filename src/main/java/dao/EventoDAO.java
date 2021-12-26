package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import eventos.Evento;

public class EventoDAO {
	private EntityManager em;

	public EventoDAO() {
	}

	public List<Evento> buscarTodos() {
		try {
			em = JPAUtil.getEntityManager();
			String jpql = "select e from Evento e";
			TypedQuery<Evento> query = em.createQuery(jpql, Evento.class);
			List<Evento> eventos = query.getResultList();
			return eventos;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public long persistir(Evento evento) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.persist(evento);
			em.getTransaction().commit();
			return evento.getIdentificador();
		} catch (Exception e) {
			if (em.getTransaction().isActive())
				em.getTransaction().rollback();
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public Evento pesquisarPeloNome(String nomeProcurado) {
		try {
			em = JPAUtil.getEntityManager();
			String jpql = "select e from Evento e where lower(e.nome) like :nome";
			TypedQuery<Evento> query = em.createQuery(jpql, Evento.class);
			query.setParameter("nome", "%".concat(nomeProcurado.toLowerCase()).concat("%"));
			List<Evento> eventos = query.getResultList();
			if (eventos.size() == 0)
				return null;
			else if (eventos.size() == 1)
				return eventos.get(0);
			else {
				System.out.println("Localizado mais de um evento com esse nome");
				return eventos.get(0);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public boolean atualizar(Evento evento) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.merge(evento);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			if (em.getTransaction().isActive())
				em.getTransaction().rollback();
			System.out.println(e.getMessage());
			return false;
		}
	}

	public boolean remover(long id) {
		try {
			em = JPAUtil.getEntityManager();
			Evento evento = em.find(Evento.class, id);
			if (evento != null) {
				em.getTransaction().begin();
				em.remove(em);
				em.getTransaction().commit();
				return true;
			} else
				return false;
		} catch (Exception e) {
			if (em.getTransaction().isActive())
				em.getTransaction().rollback();
			System.out.println(e.getMessage());
			return false;
		}
	}

	public Evento buscarRegistroPorId(long id) {
		try {
			em = JPAUtil.getEntityManager();
			return em.find(Evento.class, id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
}
