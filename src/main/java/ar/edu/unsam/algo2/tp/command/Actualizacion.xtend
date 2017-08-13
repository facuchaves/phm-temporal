package ar.edu.unsam.algo2.tp.command

import ar.edu.unsam.algo2.tp.Repositorio
import java.util.List

class Actualizacion extends Command{
	
	List<Repositorio> repositorios
	
	new(List<Repositorio> repositorios) {
		this.repositorios = repositorios
	}
	
	override execute() {
		repositorios.forEach[ updateAll ]
	}
	
} 