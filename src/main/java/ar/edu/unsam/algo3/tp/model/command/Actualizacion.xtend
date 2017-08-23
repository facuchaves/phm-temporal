package ar.edu.unsam.algo3.tp.model.command

import ar.edu.unsam.algo3.tp.model.Repositorio
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