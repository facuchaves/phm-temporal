package ar.edu.unsam.algo2.tp.command

import java.util.List

class AdministacionDelSistema implements AdministacionDelSistemaI{
	
	List<Command> comandos = newArrayList
	
	override run(List<Command> comandos) {
		comandos.forEach[ execute ]
	}
	
	def void agregarComando(Command _comando){
		comandos.add(_comando)
	}
	
	def List<Command> listaComandos(){
		comandos
	}
	
	override runIndividual(Command comando) {
		comando.execute()
	}
	
	
	
	
}