package ar.edu.unsam.algo2.tp.command

import ar.edu.unsam.algo2.tp.RepositorioEntrenador
import ar.edu.unsam.algo2.tp.observer.CustomObserver
import java.util.List

class RemoverAcciones extends Command{
	
	List<CustomObserver> customObservers
		
	RepositorioEntrenador repositorioEntrenador
	
	new( List<CustomObserver> customObservers ) {
		this.customObservers = customObservers
	}
	
	override execute() {
		repositorioEntrenador.entrenadores.forEach[ quitarObservers( customObservers ) ]
	}
	
}