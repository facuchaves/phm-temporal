package ar.edu.unsam.algo2.tp.command

import ar.edu.unsam.algo2.tp.RepositorioEntrenador
import ar.edu.unsam.algo2.tp.observer.CustomObserver
import java.util.List

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Calendar
import java.time.LocalDateTime

@Observable
@Accessors
class AgregarAcciones extends Command {

	List<CustomObserver> customObservers = newArrayList
	

	new() {
	}

	new(List<CustomObserver> customObservers) {
		this.customObservers = customObservers
	}

	override execute() {
		super.execute
		RepositorioEntrenador.instance.entrenadores.forEach[entrenador|entrenador.agregarObservers(customObservers)]
	}

	

	def agregarAccionIndividual(CustomObserver _customObservers) {
		customObservers.add(_customObservers)
	}

	def eliminarAccionIndividual(CustomObserver _customObservers) {
		if (customObservers.contains(_customObservers)) {
			customObservers.remove(_customObservers)
		}
	}
	
	
}
