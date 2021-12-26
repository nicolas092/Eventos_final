package teste;

import dao.EventoDAO;
import dao.UsuarioDAO;
import eventos.Evento;
import util.Usuario;

public class Testes {
	public static void main(String[] args) {
//		Usuario usuario = new Usuario("teste", "123456");

//		System.out.println(usuario.autenticar());

//		System.out.println(usuario.salvar());
//		usuario.setEmail("teste2");
//		usuario.atualizar();
//		usuario.buscarTodos().stream().forEach(System.out::println);
//		System.out.println(usuario.buscarRegistroPorId());
//		usuario.remover();
//		usuario.buscarTodos().stream().forEach(System.out::println);
		Evento evento = new Evento();
		EventoDAO usuariodao = new EventoDAO();
		evento.setNome("Evento Teste");
//		System.out.println(usuariodao.persistir(evento));
		System.out.println(usuariodao.pesquisarPeloNome("tes"));
	}
}
