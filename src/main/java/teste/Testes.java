package teste;

import java.time.LocalDateTime;

import eventos.Evento;
import eventos.Local;
import util.Situacao;

public class Testes {
	public static void main(String[] args) {
//		Usuario usuario = new Usuario("teste", "123456");
//		System.out.println(usuario.salvar());
//		usuario.setEmail("teste2");
//		System.out.println(usuario.autenticar());

//		System.out.println(usuario.atualizar());
//		usuario.buscarTodos().stream().forEach(System.out::println);
//		System.out.println(usuario.buscarRegistroPorId(2));

//		System.out.println(usuario.remover());
//		usuario.buscarTodos().stream().forEach(System.out::println);

		// evento, local, pessoa, participante

		Local local = new Local();
		local.setInstituicao("IFRS");
		local.setTelefone("51986569754");
		local.setOrganizador("Nícolas");
		System.out.println(local.persistir());
		
		Evento evento = new Evento();
		evento.setNome("Churrasco");
		evento.setTaxaInscricao(25.3);
		evento.setData(LocalDateTime.of(2022, 1, 22, 12, 30));
		evento.setSituacao(Situacao.ANDAMENTO);
		evento.setLocal(local);
		System.out.println(evento.persistir());
		
		
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
