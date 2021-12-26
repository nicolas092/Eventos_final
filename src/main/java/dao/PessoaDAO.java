package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import pessoas.Pessoa;

public class PessoaDAO {
	EntityManager em;

	public PessoaDAO() {
	}

	public long persistir(Pessoa pessoa) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.persist(pessoa);
			em.getTransaction().commit();
			return pessoa.getId();
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
			Pessoa pessoa = em.find(Pessoa.class, id);
			if (pessoa == null) {
				System.out.println("Pessoa com id " + id + " não encontrado na base de dados");
				return false;
			} else {
				em.getTransaction().begin();
				em.remove(pessoa);
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

	public boolean atualizar(Pessoa pessoa) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.merge(pessoa);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			if (em.getTransaction().isActive())
				em.getTransaction().rollback();
			System.out.println(e.getMessage());
			return false;
		}
	}

	public List<Pessoa> buscarTodos() {
		try {
			em = JPAUtil.getEntityManager();
			String jpql = "select p from Pessoa p";
			TypedQuery<Pessoa> query = em.createQuery(jpql, Pessoa.class);
			List<Pessoa> locais = query.getResultList();
			return locais;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public Pessoa buscarRegistroPorId(long id) {
		try {
			em = JPAUtil.getEntityManager();
			return em.find(Pessoa.class, id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public Pessoa pesquisarPeloNome(String nomeProcurado) {
		try {
			em = JPAUtil.getEntityManager();
			String jpql = "select p from Pessoa p where lower(p.nome) like :nomeProcurado";
			TypedQuery<Pessoa> query = em.createQuery(jpql, Pessoa.class);
			query.setParameter("nomeProcurado", "%".concat(nomeProcurado.toLowerCase()).concat("%"));
			List<Pessoa> locais = query.getResultList();
			if (locais.size() == 0) {
				System.out.println("Nenhuma pessoa com nome \"" + nomeProcurado + "\" encontrada");
				return null;
			} else if (locais.size() == 1) {
				return locais.get(0);
			} else {
				System.out.println("Localizado mais de uma pessoa com nome \"" + nomeProcurado + "\"");
				return locais.get(0);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
}
