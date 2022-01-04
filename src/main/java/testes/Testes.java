package testes;

import java.util.Arrays;
import java.util.List;

import pessoas.Participante;

//import java.time.ZoneId;
//import java.time.ZonedDateTime;
//
//import eventos.Evento;
//import eventos.Local;
//import util.Situacao;

public class Testes {
	public static void main(String[] args) {

//		Local local = new Local("Senac", "51999999999", "Nícolas");
//		System.out.println(local.persistir());
//
//		Evento evento = new Evento("Briga de torcida", 10, ZonedDateTime.of(2022, 3, 5, 12, 11, 0, 0, ZoneId.of("Australia/Brisbane")),
//				Situacao.ANDAMENTO);
//		evento.setLocal(local);
//		System.out.println(evento.persistir());
		
		List<String> emails = Arrays.asList("caroline@hotmail.com");
		Participante participante = new Participante("Caroline", "av liberdade", "51999999999", "12345678912", emails);
		System.out.println(participante.persistir());
		
		
	}
}
