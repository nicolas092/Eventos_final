package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import eventos.Local;

public class LocalDAO {
	private EntityManager em;

	public LocalDAO() {
	}

	public long persistir(Local local) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.persist(local);
			em.getTransaction().commit();
			return local.getId();
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
			Local local = em.find(Local.class, id);
			if (local == null) {
				System.out.println("Local com id " + id + " não encontrado na base de dados");
				return false;
			} else {
				em.getTransaction().begin();
				em.remove(local);
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

	public boolean atualizar(Local local) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.merge(local);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			if (em.getTransaction().isActive())
				em.getTransaction().rollback();
			System.out.println(e.getMessage());
			return false;
		}
	}

	public List<Local> buscarTodos() {
		try {
			em = JPAUtil.getEntityManager();
			String jpql = "select l from Local l";
			TypedQuery<Local> query = em.createQuery(jpql, Local.class);
			List<Local> locais = query.getResultList();
			return locais;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public Local buscarRegistroPorId(long id) {
		try {
			em = JPAUtil.getEntityManager();
			return em.find(Local.class, id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public Local pesquisarPeloNome(String nomeProcurado) {
		try {
			em = JPAUtil.getEntityManager();
			String jpql = "select l from Local l where lower(l.instituicao) like :nomeProcurado";
			TypedQuery<Local> query = em.createQuery(jpql, Local.class);
			query.setParameter("nomeProcurado", "%".concat(nomeProcurado.toLowerCase()).concat("%"));
			List<Local> locais = query.getResultList();
			if (locais.size() == 0) {
				System.out.println("Nenhum local com nome \"" + nomeProcurado + "\" encontrado");
				return null;
			} else if (locais.size() == 1) {
				return locais.get(0);
			} else {
				System.out.println("Localizado mais de um local com nome \"" + nomeProcurado + "\"");
				return locais.get(0);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

}
