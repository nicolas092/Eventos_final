package teste;

import util.Usuario;

public class Testes {
	public static void main(String[] args) {
		Usuario usuario = new Usuario("teste", "123456");
		System.out.println(usuario.salvar());
		usuario.setEmail("teste2");
		System.out.println(usuario.autenticar());
		
		System.out.println(usuario.atualizar());
//		usuario.buscarTodos().stream().forEach(System.out::println);
//		System.out.println(usuario.buscarRegistroPorId(2));
		
//		System.out.println(usuario.remover());
		usuario.buscarTodos().stream().forEach(System.out::println);

		// evento, local, pessoa, participante

//		Participante participante = new Participante("Nícolas", "av. liberdade", "04836108012");
//		System.out.println(participante.persistir()); // 1
//		participante.setNome("Nícolas Alterado");
//		System.out.println(participante.atualizar());	//true
//		System.out.println(participante.remover());	//true
//		System.out.println(participante.pesquisarPeloNome("alti"));
//		System.out.println(participante.buscarRegistroPorId(3));
//		participante.buscarTodos().stream().forEach(System.out::println);
	}
}
