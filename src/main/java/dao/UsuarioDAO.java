package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import util.Usuario;

public class UsuarioDAO {
	private EntityManager em;

	public UsuarioDAO() {
	}

	public long salvar(Usuario usuario) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.persist(usuario);
			em.getTransaction().commit();
			return usuario.getId();
		} catch (Exception e) {
			if (em.getTransaction().isActive()) {
				em.getTransaction().rollback();
			}
			System.out.println(e.getMessage());
			return 0;
		}
	}

	public boolean remover(long id) {
		try {
			em = JPAUtil.getEntityManager();
			Usuario usuario = em.find(Usuario.class, id);
			if (usuario == null) {
				System.out.println("Id " + id + " não encontrado na base de dados");
				return false;
			}
			em.getTransaction().begin();
			em.remove(usuario);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			if (em.getTransaction().isActive())
				em.getTransaction().rollback();
			System.out.println(e.getMessage());
			return false;
		}
	}

	public boolean atualizar(Usuario usuario) {
		try {
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.merge(usuario);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			if (em.getTransaction().isActive())
				em.getTransaction().rollback();
			System.out.println(e.getMessage());
			return false;
		}
	}

	public Usuario buscarRegistroPorId(long id) {
		try {
			em = JPAUtil.getEntityManager();
			return em.find(Usuario.class, id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public List<Usuario> buscarTodos() {
		try {
			em = JPAUtil.getEntityManager();
			String jpql = "select u from Usuario u";
			TypedQuery<Usuario> usuarios = em.createQuery(jpql, Usuario.class);
			return usuarios.getResultList();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	public boolean autenticar(Usuario usuario) {
		try {
			em = JPAUtil.getEntityManager();
			String jpql = "select u from Usuario u where u.email = :email and u.senha = :senha";
			TypedQuery<Usuario> query = em.createQuery(jpql, Usuario.class);
			query.setParameter("email", usuario.getEmail());
			query.setParameter("senha", usuario.getSenha());
			List<Usuario> usuarios = query.getResultList();
			if (usuarios.size() == 0)
				return false;
			else
				return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
}
