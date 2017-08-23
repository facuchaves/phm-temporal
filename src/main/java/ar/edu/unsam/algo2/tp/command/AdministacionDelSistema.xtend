package ar.edu.unsam.algo2.tp.command

import java.util.List
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
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
	
	def void eliminar(Command comando){
		comandos.remove(comando)
	}
	
	
}