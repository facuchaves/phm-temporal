package ar.edu.unsam.algo2.tp.command

import ar.edu.unsam.algo2.tp.RepositorioEntrenador
import ar.edu.unsam.algo2.tp.observer.CustomObserver
import java.util.List

class AgregarAcciones extends Command{
	
	List<CustomObserver> customObservers
		
	new( List<CustomObserver> customObservers ) {
		this.customObservers = customObservers
	}
	
	override execute() {
		RepositorioEntrenador.instance.entrenadores.forEach[ entrenador | entrenador.agregarObservers( customObservers ) ]
	}
	
}